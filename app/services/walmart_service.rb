class WalmartService

  def initialize
    @_conn = Faraday.new(url: "http://api.walmartlabs.com/v1/")
    @_conn.params["apiKey"] = ENV['WALMART_API']
  end

  def get_categories
    parse(connection.get("taxonomy"))[:categories]
  end


  private

    def connection
      @_conn
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
