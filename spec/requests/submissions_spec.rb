require 'rails_helper'

RSpec.describe 'GET /submissions' do
  subject { response }

  before do
    create_list(:submission, 3)
    get '/submissions', nil, auth
  end
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    include_examples 'ok collection response'
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'GET /exercises/:id/submissions' do
  subject { response }

  before do
    exercise = create(:exercise)
    create(:submission, exercise: exercise)
    get "/exercises/#{exercise.id}/submissions", nil, auth
  end
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    include_examples 'ok collection response'
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'GET /exercises/:id/submissions?user_id=:user_id' do
  subject { response }

  before do
    exercise = create(:exercise)
    create(:submission, exercise: exercise, user: user)
    get "/exercises/#{exercise.id}/submissions?user_id=#{user.id}", nil, auth
  end
  let(:user) { create(:student) }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    include_examples 'ok collection response'
  end

  context 'when logged in as student' do
    context 'own submissions' do
      let(:auth) { auth_for user }
      include_examples 'ok collection response'
    end
    context 'foreign submissions' do
      let(:auth) { student_auth }
      include_examples 'forbidden response'
    end
  end
end

RSpec.describe 'GET /users/:id/submissions' do
  subject { response }

  before do
    create(:submission, user: user)
    get "/users/#{user.id}/submissions", nil, auth
  end
  let(:user) { create(:student) }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    include_examples 'ok collection response'
  end

  context 'when logged in as student' do
    context 'own submissions' do
      let(:auth) { auth_for user }
      include_examples 'ok collection response'
    end
    context 'foreign submissions' do
      let(:auth) { student_auth }
      include_examples 'forbidden response'
    end
  end
end

RSpec.describe 'POST /submissions' do
  subject { response }

  before { post '/submissions', payload, auth }
  let(:payload) { {} }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  [:teacher, :student].each do |role|
    context "when logged in as #{role.to_s}" do
      let(:user) { create(role) }
      let(:auth) { auth_for user }
      context 'with invalid payload' do
        let(:payload) { attributes_for(:submission).merge(user_id: user.id) }
        include_examples 'unprocessable entity response'
      end
      context 'with valid payload' do
        let(:payload) {
          attributes_for(:submission, :file).merge(user_id: user.id, exercise_id: exercise.id)
        }
        context 'when deadline is ahead' do
          let(:exercise) { create(:exercise_with_submissions, user: user) }
          include_examples 'created response'
        end
        context 'when deadline expired' do
          let(:exercise) { create(:exercise, batch: create(:batch, :expired) ) }
          include_examples 'unprocessable entity response'
        end
      end
    end
  end
end

RSpec.describe 'GET /submissions/:id' do
  subject { response }

  before do
    submission = create(:submission, user: user)
    get "/submissions/#{submission.id}", nil, auth
  end
  let(:user) { create(:student) }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    include_examples 'ok response'
  end

  context 'when logged in as student' do
    context 'own submission' do
      let(:auth) { auth_for user }
      include_examples 'ok response'
    end
    context 'foreign submission' do
      let(:auth) { student_auth }
      include_examples 'forbidden response'
    end
  end
end

RSpec.describe 'GET /submissions/:id/file' do
  subject { response }

  before { get "/submissions/#{submission.id}/file?secret=#{secret}" }
  let(:secret) { nil }

  context 'when no file available' do
    let(:submission) { create(:submission) }
    it { is_expected.to be_not_found }
  end

  context 'when file is available' do
    let(:submission) { create(:submission, :file) }
    context 'with wrong secret' do
      include_examples 'forbidden response'
    end
    context 'with correct secret' do
      let(:secret) { submission.file_secret }
      it { is_expected.to be_ok }
    end
  end
end

RSpec.describe 'PUT /submissions/:id' do
  subject { response }

  before do
    submission = create(:submission, user: user)
    put "/submissions/#{submission.id}", payload, auth
  end
  let(:payload) { {} }
  let(:user) { create(:student) }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    context 'with invalid payload' do
      let(:payload) { attributes_for(:submission).merge(user_id: nil) }
      include_examples 'unprocessable entity response'
    end
    context 'with valid payload' do
      let(:payload) { attributes_for(:submission, :feedback) }
      include_examples 'ok response'
    end
  end

  context 'when logged in as student' do
    context 'own submission' do
      let(:auth) { auth_for user }
      include_examples 'ok response'
    end
    context 'foreign submission' do
      let(:auth) { student_auth }
      include_examples 'forbidden response'
    end
  end
end
