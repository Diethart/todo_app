class ItemsController < ApplicationController
  before_action -> { @item = Item.find(params[:id]) }, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(task: item_params[:task])

    redirect_to items_path
  end

  def show
  end

  def edit
  end

  def update
    @item.update(task: item_params[:task])

    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:task)
  end
end
