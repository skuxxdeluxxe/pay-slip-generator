$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # suppress console outputs
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    $stderr = File.new('/dev/null', 'w')
    $stdout = File.new('/dev/null', 'w')
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end
