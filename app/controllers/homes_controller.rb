class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @item_new = Item.order("created_at DESC").limit(4)
  end

  def about
  end
end
