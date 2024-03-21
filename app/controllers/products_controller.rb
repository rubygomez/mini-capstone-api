class ProductsController < ApplicationController
    # def all_products
    #     @products = Product.all
    #     render :index
    # end

    # def product_id
    #     @product = Product.find_by(id: params[:id])
    #     render :show
    # end

    def index
        @products = Product.all
        render :index
    end

    def show
        @product = Product.find_by(id: params["id"])
        render :show
    end

    def create
        @product = Product.create(
            name: params[:name],
            price: params[:price],
            description: params[:description],
            supplier_id: params[:supplier_id],
            quantity: params[:quantity]
        )
        if @product.valid?
            render :show
        else
            render json: {errors: @product.errors.full_messages }, status: 422
        end
    end
    
    def update
        @product = Product.find_by(id: params[:id])
        @product.update(
            name: params["name"] || @product.name,
            price: params["price"] || @product.price,
            description: params["description"] || @product.description,
            supplier_id: params["supplier_id"] || @product.supplier_id,
            quantity: params["quantity"] || @product.quantity,
        )
        if @product.valid?
            render :show
        else
            render json: {errors: @product.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def product_params
        params.require(:product).permit(:name, :quantity, :price, :description, :supplier_id)
    end

    def destroy
        @product = Product.find_by(id: params[:id])
        @product.destroy
        render json: { message: "Successfully deleted"}
    end
end