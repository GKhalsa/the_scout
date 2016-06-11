class ItemRepo

  def self.service
    WalmartService.new
  end

  def self.amazon_service
    AmazonService.new
  end

  def self.all
    WalmartCategoryRepo.category_ids.take(1).map do |category_id|
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

  def self.gather_amazon_hashes
    items = []
    upcs = []
    num = 9
    Item.all.each_with_index do |item, index|
      if index <= num
        items << item
        upcs << item.upc
        if index == num
          upcs_for_api_call = upcs.join(",")
          amazon_hashes = amazon_service.get_items(upcs_for_api_call)
          create_amazon_items(amazon_hashes)
          items = []
          upcs = []
          num += 10
        end
      end
    end
  end

  def self.add_amazon_data_to_walmart_item
    Item.all.each do |item|
      amazon_attributes = AmazonItem.all.find do |amazon_item|
        (amazon_item.upc == item.upc) && (amazon_item.prime == "1") && (!amazon_item.url.include?("Pack"))
      end

      unless amazon_attributes.nil?
            item.update(
                   amazon_url: amazon_attributes.url,
          lowest_amazon_price: amazon_attributes.lowest_new_price,
                 quantity_new: amazon_attributes.quantity_new,
                    salesrank: amazon_attributes.sales_rank
                        )
      end
    end
  end

  def self.create_amazon_items(amazon_hashes)
    if amazon_hashes.is_a?(Array)
      amazon_hashes.each do |hash|
        begin
          AmazonItem.create(
                           url: hash["DetailPageURL"],
              lowest_new_price: hash["OfferSummary"]["LowestNewPrice"]["Amount"],
                  quantity_new: hash["OfferSummary"]["TotalNew"],
                    sales_rank: hash["SalesRank"],
                           upc: hash["ItemAttributes"]["UPC"],
                         prime: hash["Offers"]["Offer"]["OfferListing"]["IsEligibleForPrime"]
                           )
        rescue
        end
      end
    elsif amazon_hashes.is_a?(Array) == false
      binding.pry
    end
  end



end
