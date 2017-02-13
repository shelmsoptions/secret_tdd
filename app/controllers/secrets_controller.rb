class SecretsController < ApplicationController
  def create
    @secret = Secret.new(content: params[:new_secret], user: current_user)
  end

  def index
    @secrets = Secret.all
  end
end