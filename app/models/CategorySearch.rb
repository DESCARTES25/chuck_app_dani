require 'httparty'

# Or wrap things up in your own class
class CategorySearch
  include HTTParty
  base_uri 'https://api.chucknorris.io/jokes'

  def categories
    
    category_array =  self.class.get("/categories")

    Categorium.delete_all

    category_array.each do |item|
      
       Categorium.insert({name: item})

    end

  end

end
