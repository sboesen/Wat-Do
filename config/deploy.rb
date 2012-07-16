require "rvm/capistrano"
require "bundler/capistrano"
set :rvm_ruby_string, '1.9.2@wat-do'
set :rvm_bin_path, "/usr/local/rvm/bin"
set :application, 'wat-do'
set :user, 'stefan'

set :deploy_to, "/var/www/#{application}"
set :use_sudo,    false


set :repository, "git@github.com:sboesen/Wat-Do.git"
set :scm, "git"
role :web, "wat.do"                          # Your HTTP server, Apache/etc
role :app, "wat.do"                          # This may be the same as your `Web` server
role :db,  "wat.do", :primary => true # This is where Rails migrations will run


load 'deploy/assets'

namespace :deploy do
  namespace :assets do
    desc 'Run the precompile task locally and rsync with shared'
    task :precompile, :roles => :web, :except => { :no_release => true } do
      %x{bundle exec rake assets:precompile}
      %x{rsync --recursive --times --rsh=ssh --compress --human-readable --progress public/assets #{user}@#{web}:#{shared_path}}
      %x{bundle exec rake assets:clean}
    end
  end
end

namespace :db do
  desc "Create database yaml in shared path"
  task :default do
    db_config = ERB.new <<-EOF
    base: &base
      adapter: sqlite3
      pool: 5
      timeout: 5000

    development:
      database: #{application}_dev.sqlite3
      <<: *base

    test:
      database: #{application}_test.sqlite3
      <<: *base

    production:
      database: #{application}_production.sqlite3
      <<: *base
    EOF

    run "mkdir -p #{shared_path}/config"
    put db_config.result, "#{shared_path}/config/database.yml"
  end

  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :rvm do
  desc "Create correct RVM file"
  task :create_rvmrc do
    run "cd #{current_path} && rvm use 1.9.2@#{application} --rvmrc --create"
  end
end

before "deploy:setup", :db
after "deploy:update_code", "db:symlink"
after "deploy:symlink", "rvm:create_rvmrc"
