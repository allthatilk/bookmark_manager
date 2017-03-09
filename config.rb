require 'data_mapper'
require 'dm-postgres-adapter'

Sinatra::Base.configure :development do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_development")
end

Sinatra::Base.configure :test do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_test")
end
