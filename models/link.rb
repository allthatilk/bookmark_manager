require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id,       Serial
  property :title,    String
  property :url,      String

  has n, :tag, :through => Resource
end

class Tag
  include DataMapper::Resource

  property :id,       Serial
  property :tag,      String

  has n, :link, :through => Resource
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!
