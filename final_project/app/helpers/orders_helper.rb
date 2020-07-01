module OrdersHelper
  def final_price
    orders = Order.all
    price = 0
    orders.each do |order|
      product = Product.find(order.product_id)
      price += order.quantity * product.price
    end
    return price
  end

  def update_stock
    orders = Order.all
    orders.each do |order|
      product = Product.find(order.product_id)
      product.quantity -= order.quantity
    end
  end
end
