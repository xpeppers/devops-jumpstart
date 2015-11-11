set :application, 'Blog'
set :user, 'vagrant'
set :deploy_to, '/home/vagrant'
set :scm, :copy

namespace :deploy do
  task :stop_server do
    on roles(:app) do
      within release_path do
        rake 'stop'
      end
    end
  end

  task :migrate_db do
    on roles(:app) do
      within release_path do
        rake 'db:migrate'
      end
    end
  end

  task :start_server do
    on roles(:app) do
      within release_path do
        rake 'start'
        execute 'sudo', 'service nginx restart'
      end
    end
  end

  before :updated, :stop_server
  after :updated, :migrate_db
  after :finished, :start_server
end
