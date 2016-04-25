require 'rails_helper'

RSpec.describe 'GET /users' do
  subject { response }

  before do
    create_list(:student, 3)
    get '/users', nil, auth
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

RSpec.describe 'POST /users' do
  subject { response }

  before { post '/users', payload }
  let(:payload) { {} }

  context 'with invalid payload' do
    let(:payload) { { email: '' } }
    include_examples 'unprocessable entity response'
  end

  context 'with duplicate email' do
    let(:payload) { attributes_for(:student, email: create(:student).email) }
    include_examples 'unprocessable entity response'
  end

  context 'with new email' do
    let(:payload) { attributes_for(:student) }
    include_examples 'created response'
  end
end

RSpec.describe 'POST /users/sign_in' do
  subject { response }

  before { post '/users/sign_in', payload }
  let(:user) { create(:user) }

  context 'non existing user' do
    let(:payload) { { email: 'none', password: 'none' } }
    include_examples 'unprocessable entity response'
  end

  context 'existing user with wrong password' do
    let(:payload) { { email: user.email, password: 'none' } }
    include_examples 'unprocessable entity response'
  end

  context 'existing user with corret password' do
    let(:payload) { { email: user.email, password: user.password } }
    include_examples 'ok response'
  end
end

RSpec.describe 'POST /users/password' do
  subject { response }

  before { post '/users/password', payload }
  let(:user) { create(:user) }
  let(:payload) { {} }

  context 'non existing user' do
    let(:payload) { { email: 'none' } }
    include_examples 'accepted response'
  end

  context 'existing user' do
    let(:payload) { { email: user.email } }
    include_examples 'accepted response'
  end
end
