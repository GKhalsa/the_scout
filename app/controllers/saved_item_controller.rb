class SavedItemController < Api::ApiController

  def create
    attributes = Item.find(params["item"]).attributes
    filtered_attributes = filter(attributes)
    current_user.saved_items.create(filtered_attributes)
    redirect_to root_path
  end

  def index
    current_user ? @items = current_user.saved_items : @items = []
  end

  def destroy
    SavedItem.find(params[:id]).destroy
    redirect_to saved_items_path
  end

  private

    def filter(attributes)
      attributes.reject! {|k,v| %w"id created_at updated_at".include?(k)}
    end

end
