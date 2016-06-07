class WalmartCategoryRepo

  def self.service
    WalmartService.new
  end

  def self.all
    category_array_hash = service.get_categories
    category_array_hash.map do |category|
      Category.create(id: category[:id], name: category[:name])
    end
  end

  def self.gather_ids
    Category.pluck(:id)
  end

end
