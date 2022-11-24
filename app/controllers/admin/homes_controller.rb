class Admin::HomesController < ApplicationController
  
  before_action :authenticate_admin!

  def top
    @orders = Order.allpage(params[:page]).order(created_at: "DESC")
  end

end
