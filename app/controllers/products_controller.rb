class ProductsController < ApplicationController
    before_action :set_user, only: [:show, :destroy]

    def index
        @products = Product.all

        render(json: ProductSerializer.new(@products).serializable_hash.to_json)
    end

    def show
        render json: @product, status: :ok
    end

    def create
        @product = Product.new(product_params)
        if @product.save
        render json: @product, status: :created
        else
        render json: { errors: @product.errors.full_messages },
                status: :unprocessable_entity
        end
    end

    def update
        unless @product.update(product_params)
            render json: { errors: @product.errors.full_messages },
                   status: :unprocessable_entity
        end
    end

    def destroy
        @product.destroy
    end

    private

    def set_product
        @product = Product.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        render json: { errors: 'product not found' }, status: :not_found
    end

    def product_params
      params.permit(:name, :url, :manufacturer, :prod_desc, :prod_feature, :price, :category_id)
    end

end
