class Api::ProductsController < ApplicationController
    
    def index
    @products = Product.all
    @products = Product.where(division: division) if division
    Rails.logger.debug params.inspect
    
    render 'api/products/index'
    end

    def show
        @product = Product.find_by(id: params[:id])
        if @product
            render 'api/products/show'
        else
            render json: { errors: ['Product Not Found'] }, status: 404
        end
    end

    private

    def product_params
        params.require(:product).permit(:divison)
    end

    def division
        params[:division]
    end

end
