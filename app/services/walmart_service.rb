class WalmartService

  def initialize
    @_conn = Faraday.new(url: "http://api.walmartlabs.com")
    @_conn.params["apiKey"] = ENV['WALMART_API']
    @_conn.params["per_page"] = 1000
  end

  def get_categories
    parse(connection.get("/v1/taxonomy"))[:categories]
  end

  def get_items(category)
    parse(connection.get("/v1/paginated/items", category))
    # x = parse(connection.get("/v1/paginated/items", {category: 91083}))
  end

  def get_next_item_page(path)
    parse(connection.get("#{path}"))
  end

#   def stations_by_zip(params)
#  response = connection.get("nearest", params)
#  parse(response)[:fuel_stations]
# end

  private

    def connection
      @_conn
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
