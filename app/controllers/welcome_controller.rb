class WelcomeController < ApplicationController

  def index
    current_user ? @items = ItemAnalyst.ordered_profitability : @items = []
  end

end
