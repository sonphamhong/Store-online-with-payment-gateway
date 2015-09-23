class Cart < ActiveRecord::Base
  has_many :items, class_name: "CartItem", dependent: :destroy

  def self.create_cart product_id, session_id
    cart = Cart.create(session_id: session_id)
    cart.items.create(product_id: product_id, quantity: 1)
  end

  def add_item product_id
    item = self.items.find_by(product_id: product_id)
    if item.present?
      item.update_attributes(quantity: item.quantity+1)
    else
      self.items.create(product_id: product_id, quantity: 1)
    end
  end

  def empty?
    self.items.empty?
  end

  def total_price
    total_price = 0
    self.items.each do |items|
      total_price += items.total_price
    end
    total_price
  end
end
