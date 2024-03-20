class ImagesController < ApplicationController
    def index
        @images = Image.all
        render :index
    end

    def show
        @image = Image.find_by(id: params["id"])
        render :show
    end

    def create
        @image = Image.create(
            url: params["url"],
            product_id: params["product_id"],
        )
        if @image.valid?
            render :show
        else
            render json: {errors: @image.errors.full_messages }, status: 422
        end
    end
    
    def update
        @image = Image.find_by(id: params[:id])
        @image.update(
            url: params["url"] || @product.url,
            product_id: params["product_id"] || @product.product_id,
        )
        if @image.valid?
            render :show
        else
            render json: {errors: @image.errors.full_messages }, status: 422
        end
    end
2
    def destroy
        @image = Image.find_by(id: params[:id])
        @image.destroy
        render json: { message: "Successfully deleted"}
    end
end
end
