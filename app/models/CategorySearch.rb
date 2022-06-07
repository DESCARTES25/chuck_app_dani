require 'httparty'

# Or wrap things up in your own class
class CategorySearch
  include HTTParty
  base_uri 'https://api.chucknorris.io/jokes'

  def categories
    
    category_array =  self.class.get("/categories")

    category_array.each do |item|
       puts item
       
       Categorium.upsert({name: item}, unique_by: [:name])

    end

    # Categorium.upsert_all(category_array.map { |name|
    #   {name: name}
    # }, unique_by: [:name])

  end

end
