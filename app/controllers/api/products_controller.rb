class Api::ProductsController < ApplicationController
    include Pagy::Backend
    
    def index
        @products_scope = params[:division].present? ? Product.where(division: params[:division]) : Product.all

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
