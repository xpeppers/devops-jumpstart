node {
  stage 'Commit'
  checkout scm
  sh 'bundle install --path ~/.gem'
  sh 'bundle exec rake db:migrate'
  sh 'bundle exec rake spec'

  stage 'Acceptance'
  sh 'cap testing deploy'
  sh 'bundle install --path ~/.gem'
  sh 'bundle exec rake features BLOG_HOST=http://testing'

  stage 'Production'
  sh 'cap production deploy'
}
