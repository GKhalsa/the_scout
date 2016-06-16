require "rails_helper"

describe ItemAnalyst do
  it "adds the profit attribute" do
    item = create(:item, profit: nil)

    ItemAnalyst.add_to_profit_attribute

    expect(Item.first.profit).to eq(-73.26)
  end

  it "adds the margin attribute" do
    item = create(:item, profit_margin: nil)

    ItemAnalyst.add_profit_margin

    expect(Item.first.profit_margin).to eq(-99.0)
  end
end
