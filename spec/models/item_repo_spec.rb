require "rails_helper"

RSpec.describe ItemRepo do

  it "parses and sorts the items" do
    VCR.use_cassette("category_repo#get_ids") do
      WalmartCategoryRepo.all

      expect(ItemRepo.all.count).to eq(200)

      expect(Item.count).to eq(0)
      ItemRepo.create_items_in_database
      expect(Item.count).to eq(200)
    end
  end

  it "stores amazon hashes into a database" do
    amazon_hash = [{"SalesRank" => "1111","OfferSummary" => {"TotalNew" => "1","LowestNewPrice" => {"Amount" => "101"}},"DetailPageURL" => "www.hello.com", "ItemAttributes" => {"UPC" => "12", "Title" => "hello"}, "Offers" => {"Offer" => {"OfferListing" => {"IsEligibleForPrime" => "1"}}} }]
    expect(AmazonItem.count).to eq(0)
    ItemRepo.store_amazon_items_in_database(amazon_hash)
    expect(AmazonItem.count).to eq(1)

    item = AmazonItem.first
    expect(item.url).to eq("www.hello.com")
    expect(item.lowest_new_price).to eq("101")
    expect(item.quantity_new).to eq("1")
    expect(item.sales_rank).to eq("1111")
    expect(item.upc).to eq("12")
    expect(item.prime).to eq("1")
  end

  it "combines amazon items and walmart items" do
    item = create(:item, salesrank: nil, lowest_amazon_price: nil, upc: "12")
    amazon_hash = [{"SalesRank" => "1111","OfferSummary" => {"TotalNew" => "1","LowestNewPrice" => {"Amount" => "101"}},"DetailPageURL" => "www.hello.com", "ItemAttributes" => {"UPC" => "12", "Title" => "hello"}, "Offers" => {"Offer" => {"OfferListing" => {"IsEligibleForPrime" => "1"}}} }]
    ItemRepo.store_amazon_items_in_database(amazon_hash)

    expect(item.salesrank).to eq(nil)

    ItemRepo.add_amazon_data_to_walmart_item
    expect(Item.first.salesrank).to eq("1111")
  end

  it "can get amazon items from upc" do
    10.times do
      create(:item)
    end

    ItemRepo.gather_amazon_hashes_from_item_upc
  end
end
