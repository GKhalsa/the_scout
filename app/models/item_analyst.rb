class ItemAnalyst

  def self.successfully_matched_items
    Item.where.not(lowest_amazon_price: nil)
  end

  def self.add_to_profit_attribute
    successfully_matched_items.each do |item|
      profit = Calculator.calculate_profit(item)
      item.update(profit: profit)
    end
  end

  def self.add_profit_margin
    successfully_matched_items.each do |item|
      profit_margin = Calculator.calculate_margin(item)
      item.update(profit_margin: profit_margin)
    end
  end

  def self.profitable_items
    successfully_matched_items.all.select { |item| item.profit > 0 }
  end

  def self.ordered_profitability
    profitable_items.sort_by {|item| item.profit_margin}.reverse
  end

  def self.ordered_by_profit
    profitable_items.sort_by {|item| item.profit}.reverse
  end

  def self.ordered_by_salesrank
    profitable_items.select  {|item| !item.salesrank.nil?}
                    .sort_by {|item|  item.salesrank.to_i}
  end

  def self.add_profitability_attributes
    add_to_profit_attribute
    add_profit_margin
  end

end
