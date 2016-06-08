class WalmartItemRepo

  def self.service
    WalmartService.new
  end

  def self.all
    WalmartCategoryRepo.category_ids.map do |category_id|
      full_item_hash = service.get_items({ category: category_id })
      item_grabber(full_item_hash)
    end.flatten!
  end

  def self.item_grabber(full_item_hash)
    items = []
    items << full_item_hash[:items]
    1.times do
      temp_item_hash = full_item_hash
      new_hash       = service.get_next_item_page(temp_item_hash[:nextPage])
      items          << new_hash[:items]
      full_item_hash = new_hash
    end
    items
  end

  def self.item_storage
    all.each do |item|
      raw_params = item
      params = ActionController::Parameters.new(raw_params)
      Item.create(params.permit(:name, :salePrice, :upc, :stock, :availableOnline))
    end
  end

end