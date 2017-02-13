class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:errors] = "Invalid Login Attempt - Email/Password is not found"
      # puts flash[:errors]
      redirect_to new_session_url
    end
  end

  def destroy
    reset_session
    puts "in sessions"
    # session[:user_id] = nil
    redirect_to "/sessions/new"
  end
end