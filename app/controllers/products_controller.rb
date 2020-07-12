class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    product = Product.new(products_params)
    begin
      product.save!
      flash[:notice] = "Produto #{product.name} adicionado com sucesso!"
      redirect_to products_path
    rescue => exc
      puts exc
      flash[:notice] = exc
      redirect_to new_product_path
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new
  end

  def update
    product = Product.find(params[:id])
    begin
      product.update!(products_params)
      flash[:notice] = "Produto #{product.name} alterado com sucesso!"
      redirect_to products_path
    rescue => exc
      puts exc
      flash[:notice] = exc
      redirect_to edit_product_path
    end
  end

  def destroy
    product = Product.find(params[:id])
    begin
      product.destroy!
      flash[:notice] = "Produto #{product.name} deletado com sucesso!"
    rescue => exc
      puts exc
      flash[:notice] = exc
    ensure
      redirect_to products_path
    end
  end

  private

  def products_params
    params.require('product').permit(:name, :alcoholic, :category_id, :quantity, :price)
  end

end
