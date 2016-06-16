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
    puts "deleted items"
    AmazonItem.destroy_all
    puts "deleted amazon items"
    ItemRepo.add_items_then_amazon_items_then_pair
    puts "item creation"
    ItemAnalyst.add_profitability_attributes
    puts "item analyst finished"
  end

end
