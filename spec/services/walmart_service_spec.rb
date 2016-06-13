require "rails_helper"

RSpec.describe WalmartService do
  context "#get_categories" do
    it "should return 25 categories" do
      service  = WalmartService.new
      response = service.get_categories

      expect(response.count).to eq(25)
      expect(response.first[:id]).to eq("91083")
      expect(response.last[:id]).to eq("2636")
    end
  end

  context "#get_items(category: 91083)" do
    it "should return 100 items based on category id" do
      service = WalmartService.new
      response = service.get_items(category: 91083)

      expect(response[:items].count).to eq(100)
    end
  end

  context "#get_next_item_page()" do
    it "should return 100 more items" do
      service = WalmartService.new
      initial_response = service.get_items(category: 91083)
      first_item = initial_response[:items].first[:itemId]
      next_page = initial_response[:nextPage]


      next_page_response = service.get_next_item_page(next_page)
      next_page_first_item = next_page_response[:items].first[:itemId]

      expect(first_item).not_to eq(next_page_first_item)
      expect(next_page_response[:items].count).to eq(100)
    end
  end
end
