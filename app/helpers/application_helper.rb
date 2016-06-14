module ApplicationHelper

  def login_or_logout
    if current_user
      link_to "Logout", logout_path, method: :delete, class: "btn btn-primary-outline"
    else
      link_to "Login", amazon_login_path, class: "btn btn-primary-outline"
    end
  end

  def formatted_salesrank(item)
    item.salesrank.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
  end

  def formatted_margin(item)
    ((item.profit_margin * 100).to_s[0..1]).to_s.delete(".")
  end

  def formatted_walmart_price(item)
    value_formatter(item.salePrice)
  end

  def formatted_profit(item)
    value_formatter(item.profit)
  end

  def value_formatter(value)
    return value.to_s.ljust(4,"0") if value.to_s.split(".").first.length == 1
    return value.to_s.ljust(5,"0") if value.to_s.split(".").first.length == 2
    value.to_s.ljust(6,"0") if value.to_s.split(".").first.length == 3
  end

  def formatted_amazon_price(item)
    (item.lowest_amazon_price.to_i / 100.0).round(2)
  end

  def formatted_name(item)
    new_name = item.name[0..65]
    return new_name if new_name.length == item.name.length
    return new_name + "..." if new_name.length < item.name.length
  end

  def export_csv_in_saved_items(items)
    link_to "Export to CSV", csv_path, class: "btn btn-danger-outline" if !items.empty?
  end


end
