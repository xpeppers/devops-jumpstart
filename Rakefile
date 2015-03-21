require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require './blog'

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :start do
  `unicorn -c config/unicorn.rb -D`
end

task :stop do
  `kill -QUIT \`cat /tmp/unicorn.blog.pid\`` if File.exists? '/tmp/unicorn.blog.pid'
end
