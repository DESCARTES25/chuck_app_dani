require 'httparty'


class ChuckCategorySearch
  include HTTParty
  base_uri 'https://api.chucknorris.io/jokes'

  def initialize(category)
    @options = { query: { category: category} }
  end

  def random_category
     return self.class.get("/random", @options)
  end

end
