class AddAttributesToItem < ActiveRecord::Migration
  def change
    add_column :items, :mediumImage, :string
    add_column :items, :productUrl, :string
    add_column :items, :amazon_image, :string
  end
end
