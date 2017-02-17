class LikesController < ApplicationController

  def create
    # grab :secret_id from hidden field form param
    like = Like.new(user_id: current_user.id, secret_id: params[:secret_id])
    if like.save
      redirect_to '/secrets'
    else
      flash[:errors] = like.errors.full_messages
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to "/secrets"
  end
end