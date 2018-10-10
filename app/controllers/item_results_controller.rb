class ItemResultsController < ApplicationController
  before_action :find_item_result, only: :update

  def update
    @item_result.update!(item_results_params)
  end

  private

  def find_item_result
    @item_result = ItemResult.find(params[:id])
  end

  def item_results_params
    params.require(:item_result).permit(:done)
  end
end
