class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @secrets = @user.secrets
  end

  def new
  end

  def create
    @user = User.new( user_params )
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).update(name: params[:name], email: params[:email])
    redirect_to "/users/#{params[:id]}"
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end