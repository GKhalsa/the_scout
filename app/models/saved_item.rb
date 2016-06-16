class SavedItem < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :salePrice, presence: true
  validates :upc, presence: true
  validates :amazon_url, presence: true
  validates :lowest_amazon_price, presence: true
  validates :profit, presence: true
  validates :profit_margin, presence: true
  validates :productUrl, presence: true
end
