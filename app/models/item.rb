class Item < ActiveRecord::Base

  def formatted_salesrank
    self.salesrank.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
  end

  def formatted_margin
    ((self.profit_margin * 100).to_s[0..1]).to_s.delete(".")
  end

  def formatted_walmart_price
    value_formatter(self.salePrice)
  end

  def formatted_profit
    value_formatter(self.profit)
  end

  def value_formatter(value)
    return value.to_s.ljust(4,"0") if value.to_s.split(".").first.length == 1
    return value.to_s.ljust(5,"0") if value.to_s.split(".").first.length == 2
    value.to_s.ljust(6,"0") if value.to_s.split(".").first.length == 3
  end

  def formatted_amazon_price
    (self.lowest_amazon_price.to_i / 100.0).round(2)
  end

  def formatted_name
    new_name = self.name[0..65]
    return new_name if new_name.length == self.name.length
    return new_name + "..." if new_name.length < self.name.length
  end

end
