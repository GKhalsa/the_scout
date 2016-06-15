class Calculator

  def self.calculate_profit(item)
    begin
      profit = ((item.lowest_amazon_price.to_i / 100.0) - item.salePrice).round(2)
    rescue
      Item.find(item.id).destroy
    end
  end

  def self.calculate_margin(item)
    # begin
      profit = calculate_profit(item)
      margin = (profit/(item.lowest_amazon_price.to_i / 100.0)).round(2)
    # rescue
    # end
  end

end
