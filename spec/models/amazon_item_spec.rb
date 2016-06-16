require 'rails_helper'

RSpec.describe AmazonItem, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:lowest_new_price) }
    it { is_expected.to validate_presence_of(:upc) }
    it { is_expected.to validate_presence_of(:prime) }
  end
end
