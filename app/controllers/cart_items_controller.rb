class CartItemsController < ApplicationController
    def create
        # Find associated product and current cart
        chosen_product = Product.find(params[:product_id])
        add_items_to_cart(chosen_product)
        
        if @cart_item.save!
            render json: @cart_item, status: :created
        else
            render json: { errors: @cart_item.errors.full_messages },
            status: :unprocessable_entity
        end
        
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
    end

    def add_quantity
        @cart_item = CartItem.find(params[:id])
        @cart_item.quantity += 1
        @cart_item.save
        redirect_back(fallback_location: @current_cart)
    end

    def reduce_quantity
        @cart_item = CartItem.find(params[:id])
        if @cart_item.quantity > 1
            @cart_item.quantity -= 1
            @cart_item.save
            redirect_back(fallback_location: @current_cart)
        elsif @cart_item.quantity == 1
            destroy
        end
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:quantity, :price, :product_id, :cart_id)
    end

    def add_items_to_cart(chosen_product)
        @current_cart = Cart.find(params[:cart_id])
        if @current_cart.products.include?(chosen_product)
            @cart_item = @current_cart.line_items.find_by(product_id: chosen_product)
            @cart_item.quantity += 1
        else
            @cart_item = CartItem.new
            @cart_item.cart = @current_cart
            @cart_item.product = chosen_product
            @cart_item.
            @cart_item.quantity = 1
        end
    end
end
