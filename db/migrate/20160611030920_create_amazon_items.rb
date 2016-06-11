class CreateAmazonItems < ActiveRecord::Migration
  def change
    create_table :amazon_items do |t|
      t.string :url
      t.string :lowest_new_price
      t.string :quantity_new
      t.string :sales_rank
      t.string :upc
      t.string :prime

      t.timestamps null: false
    end
  end
end
