class WelcomeController < ApplicationController

  def index
    @items = ItemAnalyst.ordered_profitability
  end

end
