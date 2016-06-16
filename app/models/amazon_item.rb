class AmazonItem < ActiveRecord::Base
  validates :url, presence: true
  validates :lowest_new_price, presence: true
  validates :upc, presence: true
  validates :prime, presence: true
end
