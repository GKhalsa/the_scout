class AddMarginToItem < ActiveRecord::Migration
  def change
    add_column :items, :profit_margin, :float
  end
end
