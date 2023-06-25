class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @genre = Genre.all
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def update
  end

  private



  def product_params
    params.require(:product).permit(:name, :explanation, :price, :genre_id, :is_selling, :product_image)
  end
end
