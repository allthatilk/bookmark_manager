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
