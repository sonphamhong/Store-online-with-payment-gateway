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
    @cart_items = @cart.items
  end

  def checkout
    @order_form = OrderForm.new user: User.new
  end
end
