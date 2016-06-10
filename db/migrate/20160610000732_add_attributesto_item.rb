class AddAttributestoItem < ActiveRecord::Migration
  def change
    add_column :items, :amazon_url, :string
    add_column :items, :lowest_amazon_price, :string
    add_column :items, :quantity_new, :string
    add_column :items, :salesrank, :string
  end
end
