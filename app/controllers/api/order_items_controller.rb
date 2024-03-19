class Api::OrderItemsController < ApplicationController

    before_action :require_logged_in

    def index
        if params[:order_id]
            @order_items = Order.find(params[:order_id]).order_items.order_items.order(created_at: :desc)
        else
            @order_items = OrderItem.includes(:product).order(created_at: :desc).all
        end
        
        render 'api/order_items/index'
    end


end
