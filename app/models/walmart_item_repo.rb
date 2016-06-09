class WalmartItemRepo

  def self.service
    WalmartService.new
  end

  def self.amazon_service
    AmazonService.new
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
  #extract like permited params, slice

  def self.gather_amazon_attributes
    items = []
    upcs = []
    upcs_for_api_call = items.join(",")
    num = 9
    Item.all.each_with_index do |index, item|
      if index <= num
        items << item
        upcs << item.upc
        if index == num
          amazon_items = amazon_service.get_items(upcs_for_api_call)
          pair_items(amazon_items, items)
          items = []
          upcs = []
          num += 10
        end
      end
    end
  end

  def self.pair_items(amazon_items, items)
    items.each_with_index do |index, item|
      if amazon_items[index] != nil
        item.update(attribute1: amazon_items[index]["attribute1"],
                    attribute2: amazon_items[index]["attribute2"],
                    attribute2: amazon_items[index]["attribute2"],
                    attribute2: amazon_items[index]["attribute2"])
      end
    end
  end


end
