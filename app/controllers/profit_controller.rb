class ProfitController < ApplicationController

  def index
    @items = ItemAnalyst.ordered_by_profit
  end

end
