class Api::ProductsController < ApplicationController
    include Pagy::Backend
    
    def index
        @products_scope = Product.all
        
        if params[:query].present?
            @products_scope = @products_scope.search_by_full_text(params[:query])
        end

        if params[:division].present? && params[:division] != 'All'
            @products_scope = Product.where(division: params[:division])
        end

        if params[:category].present?
            @products_scope = @products_scope.where(category: params[:category])
        end

        if params[:sub_category].present?
            @products_scope = @products_scope.where(sub_category: params[:sub_category])
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
