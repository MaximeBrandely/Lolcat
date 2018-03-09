class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.create(user_id: current_user.id)
    @order.items = current_user.cart.items
    current_user.cart.items.clear
    redirect_to orders_index_path
  end

end
