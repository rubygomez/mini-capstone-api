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
            name: params["name"],
            price: params["price"],
            image_url: params["image_url"],
            description: params["description"],
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
            image_url: params["image_url"] || @product.image_url,
            description: params["description"] || @product.description,
        )
        if @product.valid?
            render :show
        else
            render json: {errors: @product.errors.full_messages }, status: 422
        end
    end

    def destroy
        @product = Product.find_by(id: params[:id])
        @product.destroy
        render json: { message: "Successfully deleted"}
    end
end