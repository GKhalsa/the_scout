class SalesrankController < ApplicationController
  def index
    @items = ItemAnalyst.ordered_by_salesrank
  end
end
