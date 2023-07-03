class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
    # @product = Product.find(params[:id])
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = 'カート内のギフトが更新されました'
    else
      flash[:alert] = 'カート内のギフトの更新に失敗しました'
    end
    redirect_to public_cart_items_path(current_customer)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    redirect_to request.referer
  end

  def delete_all
    Customer.find(current_customer.id).cart_items.destroy_all
    redirect_to request.referer
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
        cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
        cart_item.quantity += params[:cart_item][:quantity].to_i
        cart_item.update!(quantity: cart_item.quantity)
        redirect_to public_cart_items_path
    elsif @cart_item.save!
        @cart_items = current_customer.cart_items.all
        redirect_to public_cart_items_path
    else
        render 'index'
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end
end
