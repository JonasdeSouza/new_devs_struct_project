class AddressesController < ApplicationController
  def index
    @address = Address.all
    @user = User.all
  end

  def create
    @address = Address.new(address_params)
    begin
      @address.user_id = current_user.id
      @address.save!
      flash[:notice] = "#{@address.name} adicionado com sucesso!"
    rescue => exc
      puts exc
      flash[:notice] = exc
    ensure
      redirect_to user_path(current_user.id)
    end
  end

  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
    @user = User.all
  end

  def show
    @address = Address.find(params[:id])
    @user = User.all
  end

  def _show
    @address = Address.find(params[:id])
    @user = User.all
  end

  def update
    address = Address.find(params[:id])
    begin
      address.update!(address_params)
      flash[:notice] = "Endereço modificado com sucesso!"
    rescue => exc
      puts exc
      flash[:notice] = exc
    ensure
      redirect_to address_path
    end
  end

  def destroy
    address = Address.find(params[:id])
    begin
      address.destroy!
      flash[:notice] = "#{address.name} deletado com sucesso!"
    rescue => exc
      puts exc
      flash[:notice] = exc
    ensure
      redirect_to user_path(current_user.id)
    end
  end

  private

  def address_params
    params.require('address').permit(:user_id, :cep, :name, :street, :complement, :neighborhood, :city, :state)
  end
end
