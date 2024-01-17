class Api::ProductsController < ApplicationController
    def show
        @product = Product.find_by(id: params[:id])
        if @product
            render 'api/products/show'
        else
            render json: { errors: ['Product Not Found'] }, status: 404
        end
    end
end
