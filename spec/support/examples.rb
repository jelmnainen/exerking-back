RSpec.shared_examples 'unauthorized response' do
  it { is_expected.to be_unauthorized }
  it { is_expected.to be_in_json }
  it 'should have error message' do
    is_expected.to have_node(:error)
  end
end

RSpec.shared_examples 'forbidden response' do
  it { is_expected.to have_http_status(:forbidden) }
  it { is_expected.to be_in_json }
  it 'should have error message' do
    is_expected.to have_node(:error)
  end
end

RSpec.shared_examples 'unprocessable entity response' do
  it { is_expected.to be_unprocessable_entity }
  it { is_expected.to be_in_json }
end

RSpec.shared_examples 'ok response' do
  it { is_expected.to be_ok }
  it { is_expected.to be_in_json }
end

RSpec.shared_examples 'accepted response' do
  it { is_expected.to be_accepted }
  it { is_expected.to be_in_json }
end

RSpec.shared_examples 'created response' do
  it { is_expected.to be_created }
  it { is_expected.to be_in_json }
end

RSpec.shared_examples 'ok collection response' do
  it { is_expected.to be_ok }
  it { is_expected.to be_in_json }
  it { is_expected.to be_a_collection }
end
