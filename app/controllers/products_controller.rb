class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.find_or_create_by(product_params)
    redirect_to products_path
  end

  def body
    product = Product.find(params[:id])
    render plain: product.description
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.available?
  end

  private

    def product_params
      params.require(:product).permit(:name,:description,:inventory)
    end
end
