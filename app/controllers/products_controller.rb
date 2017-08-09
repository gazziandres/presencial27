  class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


    def create
      @product = Product.new(product_params)
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product.category, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
    end
  end

    def destroy
      @product.destroy
        respond_to do |format|
          format.html { redirect_to @product.category, notice: 'Product was successfully destroyed.' }
          format.json { head :no_content }
      end
    end
  end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :category_id)
    end
