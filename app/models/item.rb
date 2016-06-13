class Item < ActiveRecord::Base

  def formatted_salesrank
    self.salesrank.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
  end

  def formatted_margin
    (self.profit_margin * 100).to_s[0..1]
  end

  def formatted_walmart_price
    return self.salePrice.to_s.ljust(4,"0") if self.salePrice.to_s.split(".").first.length == 1
    return self.salePrice.to_s.ljust(5,"0") if self.salePrice.to_s.split(".").first.length == 2
    self.salePrice.to_s.ljust(6,"0") if self.salePrice.to_s.split(".").first.length == 3
  end

  def formatted_amazon_price
    (self.lowest_amazon_price.to_i / 100.0).round(2)
  end

end
