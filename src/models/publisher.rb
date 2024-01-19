# In src/models/publisher.rb

class Publisher
  attr_accessor :id, :name, :catalog_home, :catalog_search

  def initialize(id, name, catalog_home, catalog_search)
    @id = id
    @name = name
    @catalog_home = catalog_home
    @catalog_search = catalog_search
  end

  
end