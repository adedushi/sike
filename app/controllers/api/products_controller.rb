class Api::ProductsController < ApplicationController
    include Pagy::Backend
    
    def index
        if params[:division].present? && params[:division] != 'All'
            @products_scope = Product.where(division: params[:division])
        else
            @products_scope = Product.all
        end

        @pagy, @products = pagy(@products_scope.order(:id), items: 24)

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
    
end
