class ProfitController < ApplicationController

  def index
    current_user ? @items = ItemAnalyst.ordered_by_profit : @items = []
  end

end
