RSpec::Matchers.define :be_a_collection do
  match do |response|
    JSON.parse(response.body).is_a? Array
  end
end
