require 'rails_helper'

RSpec.describe SavedItem, type: :model do
   describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:salePrice) }
    it { is_expected.to validate_presence_of(:upc) }
    it { is_expected.to validate_presence_of(:amazon_url) }
    it { is_expected.to validate_presence_of(:lowest_amazon_price) }
    it { is_expected.to validate_presence_of(:profit) }
    it { is_expected.to validate_presence_of(:profit_margin) }
    it { is_expected.to validate_presence_of(:productUrl) }
    it { is_expected.to belong_to(:user) }
   end
end
