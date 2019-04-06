class CacheBase < ActiveRecord::Base
    establish_connection DB_CACHE
    self.abstract_class = true
  end