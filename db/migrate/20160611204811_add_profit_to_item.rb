class AddProfitToItem < ActiveRecord::Migration
  def change
    add_column :items, :profit, :float
  end
end
