class SecretsController < ApplicationController
  def create
    @secret = Secret.new(content: params[:new_secret], user: current_user)
    if @secret.save
      redirect_to current_user
    else
      flash[:errors] = @secret.errors.full_messages
    end
  end

  def index
    @secrets = Secret.all
  end
end