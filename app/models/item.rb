class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :salePrice, presence: true
  validates :upc, presence: true
  validates :productUrl, presence: true
end
