FactoryGirl.define do

  factory :item do
    sequence(:name) { |n| "knex#{n}" }
    sequence(:upc) { |n| "1#{n}" }
    sequence(:stock) { |n| "#{n}" }
    sequence(:availableOnline) { |n| true }
    sequence(:amazon_url) { |n| "www.#{n}.com" }
    sequence(:lowest_amazon_price) { |n| "#{n}" }
    sequence(:quantity_new) { |n| "#{n}" }
    sequence(:salesrank) { |n| "#{n}" }
    sequence(:profit) { |n| "#{n}" }
    sequence(:profit_margin) { |n| "#{n}" }
    sequence(:mediumImage) { |n| "www.#{n}1.com" }
    sequence(:productUrl) { |n| "www.#{n}2.com" }
    sequence(:amazon_image) { |n| "www.#{n}44.com" }
    sequence(:salePrice) { |n| "#{n}" }
  end

  factory :saved_item do
    sequence(:name) { |n| "knex#{n}" }
    sequence(:upc) { |n| "1#{n}" }
    sequence(:stock) { |n| "#{n}" }
    sequence(:availableOnline) { |n| true }
    sequence(:amazon_url) { |n| "www.#{n}.com" }
    sequence(:lowest_amazon_price) { |n| "#{n}" }
    sequence(:quantity_new) { |n| "#{n}" }
    sequence(:salesrank) { |n| "#{n}" }
    sequence(:profit) { |n| "#{n}" }
    sequence(:profit_margin) { |n| "#{n}" }
    sequence(:mediumImage) { |n| "www.#{n}1.com" }
    sequence(:productUrl) { |n| "www.#{n}2.com" }
    sequence(:amazon_image) { |n| "www.#{n}44.com" }
    sequence(:salePrice) { |n| "#{n}" }
    user
  end

  factory :user do
    sequence(:name) {|n| "chaaarrlleesss#{n}"}
  end
end
