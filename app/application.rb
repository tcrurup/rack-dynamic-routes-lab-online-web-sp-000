require 'pry'

class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      binding.pry
      self.class.items.detect{ |item| item.name == item_name }.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
  
  def self.items
    @@items
  end
end