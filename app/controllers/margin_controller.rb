class MarginController < ApplicationController
  def index
    @page = params[:page].to_i

    pagination(ItemAnalyst.ordered_profitability, @page)
    current_user ? @all_items = ItemAnalyst.ordered_profitability : @all_items = []
  end
end
