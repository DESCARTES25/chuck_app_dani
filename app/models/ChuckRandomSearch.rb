require 'httparty'

class ChuckRandomSearch
  include HTTParty
  base_uri 'https://api.chucknorris.io/jokes'

  def random
    return self.class.get("/random")
  end
end

