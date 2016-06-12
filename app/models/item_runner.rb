class ItemRunner

  def self.generate_database
    WalmartCategoryRepo.all
    ItemRepo.add_items_then_amazon_items_then_pair
    ItemAnalyst.add_profitability_attributes
  end

end
