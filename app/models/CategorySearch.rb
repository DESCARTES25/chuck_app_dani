require 'httparty'

# Or wrap things up in your own class
class CategorySearch
  include HTTParty
  base_uri 'https://api.chucknorris.io/jokes'

  def categories
    return self.class.get("/categories")
  end

end


# chuck_categories = ChuckSearch.new("","", 1)
# category_array = chuck_categories.categories
# puts category_array[0]
# puts category_array[1]
