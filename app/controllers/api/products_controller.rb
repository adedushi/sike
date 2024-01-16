class Api::ProductsController < ApplicationController
    def show
        @product = Product.find_by(id: params[:id])
        if @product
            render 'api/products/show'
        else
            render json: { product: nil}
        end
    end
end
