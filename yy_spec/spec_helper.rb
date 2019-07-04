ENV["RAILS_ENV"] ||= 'test'

require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_bot'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

FactoryBot.find_definitions

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.color_enabled = true
  config.formatter     = 'documentation'
  
  config.include FactoryBot::Syntax::Methods
  
  Job.destroy_all
end
