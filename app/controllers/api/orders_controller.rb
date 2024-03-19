class Api::OrdersController < ApplicationController

    before_action :require_logged_in

    def show
        @order = Order.includes(:order_items).find(params[:id])
        render 'api/orders/show'
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            render :show
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

    private

    def order_params
        params.require(:order).permit(:user_id, :subtotal, :shipping, :total, order_items_attributes: [:product_id, :size, :quantity, :price])
    end

end
