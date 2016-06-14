require "rails_helper"

RSpec.describe AmazonService do
  context "#get_items(item_upcs)" do
    it "returns an item hash" do
      service = AmazonService.new

      response = service.get_items("035011061689")


      expect(response["DetailPageURL"]).to eq("http://www.amazon.com/Bell-CANTILEVER-3-Bike-Trunk-Rack/dp/B00066LF9I%3Fpsc%3D1%26SubscriptionId%3DAKIAJ4NP2LVGTCNPYFKQ%26tag%3Doascout-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00066LF9I")
      expect(response["OfferSummary"]["LowestNewPrice"]["Amount"]).to eq("4500")
      expect(response["OfferSummary"]["TotalNew"]).to eq("12")
      expect(response["SalesRank"]).to eq(nil)
      expect(response["ItemAttributes"]["UPC"]).to eq("035011061689")
      expect(response["Offers"]["Offer"]["OfferListing"]["IsEligibleForPrime"]).to eq("1")
      expect(response["ItemAttributes"]["Title"]).to eq("Bell CANTILEVER 300 3-Bike Trunk Rack")
    end
  end
end
