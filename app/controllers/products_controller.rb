class ProductsController < ApplicationController
    before_action :authenticate_admin, except: [:index, :show]

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
            user_id: current_user.id,
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