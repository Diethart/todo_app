class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit destroy update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)

    if item.save
      flash[:success] = t('items.success_create')
      redirect_to items_path
    else
      flash[:danger] = t('items.fail_create')
      redirect_to new_item_path
    end
  end

  def show; end

  def edit; end

  def update
    if @item.update(item_params)
      flash[:success] = t('items.success_update')
      redirect_to item_path(@item)
    else
      flash[:danger] = t('items.fail_update')
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
    @item.destroy

    flash[:success] = t('items.success_destroy')
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:task, :tag_list)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
