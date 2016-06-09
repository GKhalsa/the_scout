class AmazonService

  def initialize
    @_conn = Faraday.new(url: "")
  end

  def get_items(item_upcs)
    url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['ACCESS_KEY_ID']}&AssociateTag=oascout-20&ItemId=#{item_upcs}&IdType=UPC&SearchIndex=All&Operation=ItemLookup&ResponseGroup=Large&Service=AWSECommerceService&Timestamp="
    # url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['ACCESS_KEY_ID']}&AssociateTag=oascout-20&ItemId=035011061689,635753490879&IdType=UPC&SearchIndex=All&Operation=ItemLookup&ResponseGroup=Large&Service=AWSECommerceService&Timestamp="
    url << Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")

    signed_url = create_signature(url)
    x = connection.get(signed_url)
    y = Crack::XML.parse(x.body)["ItemLookupResponse"]["Items"]["Item"]
    # binding.pry
  end

  private

    def create_signature(url)
      AmazonSignature.new(secret: ENV['SECRET_ACCESS_KEY'], url: url).sign
    end

    def connection
      @_conn
    end

    # def parse(response)
    #   JSON.parse(response.body, symbolize_names: true)
    # end

end
