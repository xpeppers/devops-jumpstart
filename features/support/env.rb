ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'blog.rb')

require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec'

Capybara.configure do |config|
  config.default_wait_time = 3
  config.run_server = false
  config.default_driver = :poltergeist
  config.app_host = ENV['BLOG_HOST'] || 'http://localhost'
end

class BlogWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  BlogWorld.new
end
