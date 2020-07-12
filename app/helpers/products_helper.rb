module ProductsHelper
  def in_cart?(product)
    orders = Order.all
    orders.each do |order|
      if current_user.id === order.user_id
        if order.product_id === product.id
          return true
        end
      end
    end
    return false
  end
end
