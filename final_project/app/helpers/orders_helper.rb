module OrdersHelper
  def final_price
    orders = Order.all
    price = 0.0
    orders.each do |order|
      if current_user.id === order.user_id
        product = Product.find(order.product_id)
        price += order.quantity * product.price
      end
    end
    return price
  end

end
