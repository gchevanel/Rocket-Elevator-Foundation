# save cache database settings in global var
DB_CACHE = YAML::load(ERB.new(File.read(Rails.root.join("config","dwh_database.yml"))).result)[Rails.env]
