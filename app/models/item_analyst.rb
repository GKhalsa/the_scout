class ItemAnalyst

  def self.successfully_matched_items
    Item.where.not(lowest_amazon_price: nil)
  end

  def self.add_to_profit_attribute
    successfully_matched_items.each do |item|
      profit = calculate_profit(item)
      item.update(profit: profit)
    end
  end

  def self.add_profit_margin
    successfully_matched_items.each do |item|
      profit_margin = calculate_margin(item)
      item.update(profit_margin: profit_margin)
    end
  end

  def self.calculate_margin(item)
    profit = calculate_profit(item)
    margin = (profit/(item.lowest_amazon_price.to_f / 100)).round(2)
  end

  def self.profitable_items
    successfully_matched_items.all.select { |item| item.profit > 0 }
  end

  def self.calculate_profit(item)
    profit = ((item.lowest_amazon_price.to_f / 100) - item.salePrice).round(2)
  end

  def self.ordered_profitability
    profitable_items.sort_by {|item| item.profit_margin}.reverse
  end

end
