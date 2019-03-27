require 'bundler'
require 'require_all'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil

 # binding.pry
1
