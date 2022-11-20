class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def show
  end
end
