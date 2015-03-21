ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require 'rspec'

require File.expand_path '../../blog.rb', __FILE__

def app
    Blog.new
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

