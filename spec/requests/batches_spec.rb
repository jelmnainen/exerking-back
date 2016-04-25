require 'rails_helper'

RSpec.describe 'GET /batches' do
  subject { response }

  before do
    create_list(:batch, 3)
    get '/batches', nil, auth
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

RSpec.describe 'POST /batches' do
  subject { response }

  before { post '/batches', payload, auth }
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
      let(:payload) { attributes_for(:batch) }
      include_examples 'created response'
    end
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'GET /batches/:id' do
  subject { response }

  before do
    batch = create(:batch)
    get "/batches/#{batch.id}", nil, auth
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

RSpec.describe 'PUT /batches/:id' do
  subject { response }

  before do
    batch = create(:batch)
    put "/batches/#{batch.id}", payload, auth
  end
  let(:payload) { {} }
  let(:auth) { nil }

  context 'when not logged in' do
    include_examples 'unauthorized response'
  end

  context 'when logged in as teacher' do
    let(:auth) { teacher_auth }
    context 'with invalid payload' do
      let(:payload) { { deadline: '' } }
      include_examples 'unprocessable entity response'
    end
    context 'with valid payload' do
      let(:payload) { attributes_for(:batch) }
      include_examples 'ok response'
    end
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'DELETE /batches/:id' do
  subject { response }

  before do
    batch = create(:batch)
    delete "/batches/#{batch.id}", nil, auth
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
