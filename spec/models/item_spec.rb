require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:salePrice) }
    it { is_expected.to validate_presence_of(:upc) }
    it { is_expected.to validate_presence_of(:productUrl) }
  end
end
