class ProfitController < ApplicationController

  def index
    @page = params[:page].to_i

    pagination(ItemAnalyst.ordered_by_profit, @page)
    current_user ? @all_items = ItemAnalyst.ordered_profitability : @all_items = []
  end

end
