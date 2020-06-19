class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    begin
      user.save!
    rescue => exc
      puts exc
    ensure
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    begin
      user.update(user_params)
    rescue ValidationError => exc
      puts exc
      flash[:notice] = "Dados incorretos"
    ensure
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    begin
      user.destroy!
    rescue => exc
      puts exc
    ensure
      render 'new'
    end
  end

  private

  def user_params
    params.require('user').permit(:name, :email, :cpf, :address, :birth_date)
  end

end
