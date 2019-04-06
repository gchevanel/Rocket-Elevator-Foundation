task spec: ["Rocket:db:test:prepare"]

namespace :dwh do

  namespace :db do |ns|

    desc 'drop cache'
    task :drop do
      Rake::Task["db:drop"].invoke
    end
    desc 'drop create'

    task :create do
      Rake::Task["db:create"].invoke
    end
    desc 'drop setup'
 
    task :setup do
      Rake::Task["db:setup"].invoke
    end
    desc 'drop migrate'

    task :migrate do
      Rake::Task["db:migrate"].invoke
    end
    desc 'drop rollback'

    task :rollback do
      Rake::Task["db:rollback"].invoke
    end
    desc 'drop seed'

    task :seed do
      Rake::Task["db:seed"].invoke
    end
    desc 'drop version'

    task :version do
      Rake::Task["db:version"].invoke
    end

    namespace :schema do
        desc 'drop load'

      task :load do
        Rake::Task["db:schema:load"].invoke
      end
      desc 'drop dump'

      task :dump do
        Rake::Task["db:schema:dump"].invoke
      end
    end

    namespace :test do
        desc 'drop preapre'
      task :prepare do
        Rake::Task["db:test:prepare"].invoke
      end
    end

    # append and prepend proper tasks to all the tasks defined here above
    ns.tasks.each do |task|
      task.enhance ["dwh:set_custom_config"] do
        Rake::Task["dwh:revert_to_original_config"].invoke
      end
    end
  end

  task :set_custom_config do
    # save current vars
    @original_config = {
      env_schema: "db/schema.rb",
      config: Rails.application.config.dup
    }

    # set config variables for custom database
    ENV['SCHEMA'] = "db_cache/schema.rb"
    Rails.application.config.paths['db'] = ["db_cache"]
    Rails.application.config.paths['db/migrate'] = ["db_cache/migrate"]
    Rails.application.config.paths['db/seeds'] = ["db_cache/seeds.rb"]
    Rails.application.config.paths['config/database'] = ["config/dwh_database.yml"]
  end

  task :revert_to_original_config do
    # reset config variables to original values
    ENV['SCHEMA'] = @original_config[:env_schema]
    Rails.application.config = @original_config[:config]
  end
end