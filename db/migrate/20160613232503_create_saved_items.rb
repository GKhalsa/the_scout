class CreateSavedItems < ActiveRecord::Migration
  def change
    create_table :saved_items do |t|
      t.string :name
      t.float :salePrice
      t.string :upc
      t.string :stock
      t.boolean :availableOnline
      t.string :amazon_url
      t.string :lowest_amazon_price
      t.string :quantity_new
      t.string :salesrank
      t.float :profit
      t.float :profit_margin
      t.string :mediumImage
      t.string :productUrl
      t.string :amazon_image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
