require 'rails_helper'

RSpec.describe 'GET /' do
  subject { response }

  before { get '/' }

  it { is_expected.to be_ok }
end
