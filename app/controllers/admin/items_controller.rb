class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end
  
  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
    render :new
    end
  end

  def show
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :detail, :genre_id, :price, :status)
  end
end
