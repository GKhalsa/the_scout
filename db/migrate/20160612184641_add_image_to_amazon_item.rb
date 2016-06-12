class AddImageToAmazonItem < ActiveRecord::Migration
  def change
    add_column :amazon_items, :image_url, :string
  end
end
