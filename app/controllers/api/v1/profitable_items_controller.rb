class Api::V1::ProfitableItemsController < Api::ApiController

  def index
    respond_with ItemAnalyst.ordered_profitability
  end

end
