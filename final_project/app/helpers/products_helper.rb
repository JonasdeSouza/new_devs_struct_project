module ProductsHelper
  def in_cart?(product)
    orders = Order.all
    orders.each do |order|
      if order.product_id === product.id
        return true
      end
    end
    return false
  end
end
