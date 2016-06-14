class SalesrankController < ApplicationController
  def index
  current_user ? @items = ItemAnalyst.ordered_by_salesrank : @items = []
  end
end
