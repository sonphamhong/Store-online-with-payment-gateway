class CartsController < ApplicationController
  before_filter :get_cart
  def add
    product = Product.find_by(params[:id])
    if product.present?
      if @cart.present? 
        @cart.add_item params[:id]
      else
        Cart.create_cart(params[:id], session.id)
      end
      redirect_to :back, notice: "Added #{product.name} to cart"
    else
      redirect_to root_path, notice: "Product not exist"
    end
  end

  def show
    if @cart.present?
      @cart_items = @cart.items.includes(:product)
    else
      @cart_items = []
    end
  end

  def checkout
    @order_form = OrderForm.new user: User.new
  end

  def destroy
    type = params[:type]
    if type == "item"
      item = CartItem.find_by(params[:id])
      item.destroy()
      notice = "Item has removed from cart"
      url = :back
    else
      @cart.destroy
      notice = "Cart has removed"
      url = root_path
    end
    redirect_to url, notice: notice
  end
end
