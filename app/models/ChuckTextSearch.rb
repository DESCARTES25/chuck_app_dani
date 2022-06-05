require 'httparty'

class ChuckTextSearch
  include HTTParty
  base_uri 'https://api.chucknorris.io/jokes'

  def initialize(query_text)
    @options = { query: { query: query_text } }
  end

  def query_text
    return self.class.get("/search", @options)
  end

end
