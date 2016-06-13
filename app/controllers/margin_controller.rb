class MarginController < ApplicationController
  def index
    @items = ItemAnalyst.ordered_profitability
    render "welcome/index.html.erb"
  end
end
