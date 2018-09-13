class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)

    if item.save
      redirect_to items_path
      return
    end

    render :new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
      return
    end

    render :edit
  end

  def destroy
    @item.destroy

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:task)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
