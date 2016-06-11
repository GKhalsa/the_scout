class AmazonService

  def initialize
    @_conn = Faraday.new(url: "")
  end

  def get_items(item_upcs)
    begin
      url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['ACCESS_KEY_ID']}&AssociateTag=oascout-20&ItemId=#{item_upcs}&IdType=UPC&SearchIndex=All&Operation=ItemLookup&ResponseGroup=Large&Service=AWSECommerceService&Timestamp="
      # url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['ACCESS_KEY_ID']}&AssociateTag=oascout-20&ItemId=035011061689,635753490879&IdType=UPC&SearchIndex=All&Operation=ItemLookup&ResponseGroup=Large&Service=AWSECommerceService&Timestamp="

      url << Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")

      signed_url = create_signature(url)
      response = connection.get(signed_url)
      Crack::XML.parse(response.body)["ItemLookupResponse"]["Items"]["Item"] unless response.nil?
    rescue
      puts "sleepytime"
      sleep(2)
    end
  end

  # def get_item(item_upcs)
  #   url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['ACCESS_KEY_ID']}&AssociateTag=oascout-20&ItemId=#{item_upcs}&IdType=UPC&SearchIndex=All&Operation=ItemLookup&TotalResultsResponseGroup=Large&Service=AWSECommerceService&Timestamp="
  #   # url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['ACCESS_KEY_ID']}&AssociateTag=oascout-20&ItemId=035011061689,635753490879&IdType=UPC&SearchIndex=All&Operation=ItemLookup&ResponseGroup=Large&Service=AWSECommerceService&Timestamp="
  #
  #   url << Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
  #
  #   signed_url = create_signature(url)
  #   response = connection.get(signed_url)
  #   Crack::XML.parse(response.body)["ItemLookupResponse"]["Items"]["Item"] unless response.nil?
  # end

  private

    def create_signature(url)
      AmazonSignature.new(ENV['SECRET_ACCESS_KEY'], url).sign
    end

    def connection
      @_conn
    end

end
