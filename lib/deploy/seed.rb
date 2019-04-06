namespace :deploy do
    desc "reload the database with seed data"
    task :seed do
      run "cd #{/db/seeds.rb}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
    end
  end