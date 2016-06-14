class MarginController < ApplicationController
  def index
    current_user ? @items = ItemAnalyst.ordered_profitability : @items = []
    render "welcome/index.html.erb"
  end
end
