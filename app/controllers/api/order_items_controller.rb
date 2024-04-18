class Api::OrderItemsController < ApplicationController

    before_action :require_logged_in

    def index
        if params[:order_id]
            order = current_user.orders.find_by(id: params[:order_id])
            
            if order.nil?
                render json: { errors: ['Order not found'] }, status: 403
                return
            end

            @order_items = order.order_items.order(created_at: :desc)

        else
            @order_items = current_user.order_items.includes(:product).order(created_at: :desc)
        end
        
        render 'api/order_items/index'
    end

end
