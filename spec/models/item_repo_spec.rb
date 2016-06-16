require "rails_helper"

RSpec.describe ItemRepo do
  it "parses and sorts the items" do
    VCR.use_cassette("all#items") do
      WalmartCategoryRepo.all

      expect(ItemRepo.all.count).to eq("")
    end
  end
end
