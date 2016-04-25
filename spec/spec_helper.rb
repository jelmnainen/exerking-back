RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!

  config.include FactoryGirl::Syntax::Methods
  config.include APIMatchers::RSpecMatchers, type: :request
end

APIMatchers.setup do |config|
  config.response_body_method = :body
  config.http_status_method = :status
  config.header_method = :headers
  config.header_content_type_key = 'Content-Type'
end
