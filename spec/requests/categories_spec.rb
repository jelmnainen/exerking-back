require 'rails_helper'

RSpec.describe 'GET /categories' do
  subject { response }

  before do
    create_list(:category, 3)
    get '/categories', nil, auth
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

RSpec.describe 'POST /categories' do
  subject { response }

  before { post '/categories', payload, auth }
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
      let(:payload) { attributes_for(:category) }
      include_examples 'created response'
    end
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'GET /categories/:id' do
  subject { response }

  before do
    category = create(:category)
    get "/categories/#{category.id}", nil, auth
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

RSpec.describe 'UPDATE /categories/:id' do
  subject { response }

  before do
    category = create(:category)
    put "/categories/#{category.id}", payload, auth
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
      let(:payload) { attributes_for(:category) }
      include_examples 'ok response'
    end
  end

  context 'when logged in as student' do
    let(:auth) { student_auth }
    include_examples 'forbidden response'
  end
end

RSpec.describe 'DELETE /categories/:id' do
  subject { response }

  before do
    category = create(:category)
    delete "/categories/#{category.id}", nil, auth
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
