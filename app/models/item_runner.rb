class ItemRunner

  def self.generate_database
    WalmartCategoryRepo.all
    puts "created categories"
    ItemRepo.add_items_then_amazon_items_then_pair
    puts "item creation"
    ItemAnalyst.add_profitability_attributes
    puts "item analyst finished"
  end

  def self.reset_database
    Item.destroy_all
    AmazonItem.destroy_all
    ItemRepo.add_items_then_amazon_items_then_pair
    ItemAnalyst.add_profitability_attributes
  end

end
