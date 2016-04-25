require 'rails_helper'

RSpec.describe 'GET /exercises' do
  subject { response }

  before do
    create_list(:exercise, 3)
    get '/exercises', nil, auth
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
    include_examples 'ok collection response'
  end
end

RSpec.describe 'POST /exercises' do
  subject { response }

  before { post '/exercises', payload, auth }
  let(:payload) { {} }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    context 'with invalid payload' do
      include_examples 'unprocessable entity response'
    end
    context 'with valid payload' do
      let(:payload) { attributes_for(:exercise).merge(batch_id: create(:batch).id) }
      include_examples 'created response'
    end
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'GET /exercises/:id' do
  subject { response }

  before do
    exercise = create(:exercise)
    get "/exercises/#{exercise.id}", nil, auth
  end
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    include_examples 'ok response'
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'ok response'
  end
end

RSpec.describe 'PUT /exercises/:id' do
  subject { response }

  before do
    exercise = create(:exercise)
    put "/exercises/#{exercise.id}", payload, auth
  end
  let(:payload) { {} }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    context 'with invalid payload' do
      let(:payload) { { title: '' } }
      include_examples 'unprocessable entity response'
    end
    context 'with valid payload' do
      let(:payload) { attributes_for(:exercise) }
      include_examples 'ok response'
    end
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'DELETE /exercises/:id' do
  subject { response }

  before do
    exercise = create(:exercise)
    delete "/exercises/#{exercise.id}", nil, auth
  end
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    include_examples 'ok response'
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end
