package 'ruby2.2'
package 'ruby2.2-dev'

file '/etc/gemrc' do
  content 'gem: --no-rdoc --no-ri'
  not_if { File.exists? '/etc/gemrc' }
end

gem_package 'bundler'
gem_package 'capistrano'
gem_package 'capistrano-scm-copy'
gem_package 'capistrano-bundler'
