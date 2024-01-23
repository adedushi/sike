class Api::CartItemsController < ApplicationController

    before_action :require_logged_in

    def index
        @cart_items = current_user.cart_items
    end

    def show
        @cart_item = CartItem.find(params[:id])
    end

    def create
        @cart_item = CartItem.new(cart_item_params)
        if @cart_item.save 
            render :show
        else
            render json: { errors: ['Item Not Added']}, status: 422
        end
    end

    def update
        @cart_item = current_user.cart_items.find(params[:id])

        if @cart_item.update(cart_item_params)
            render :show
        else
            render json: { errors: @cart_item.errors.full_messages }, status: 422
        end
    end

    def destroy
        @cart_item = current_user.cart_items.find(params[:id])

        if @cart_item.destroy
            render json: { message: 'Item Removed.' }, status: :ok
        else
            render json: { errors: @cart_item.errors.full_messages }, status: 422
        end
    end



    private

    def cart_item_params
        params.require(:cart_item).permit(:product_id, :size, :quantity, :user_id, :checked_out)
    end
end

