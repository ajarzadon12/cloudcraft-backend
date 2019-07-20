class UsersController < ApplicationController
  def login
    user = User.where(username: user_params[:username]).last
    if user&.authenticate(user_params[:password])
      render json: { success: true, user_id: user.id.to_s }
    else
      render json: { success: false }
    end
  end

  def register
    user = User.new(user_params)
    if user.save
      render json: { success: true, user_id: user.id.to_s }
    else
      render json: { success: false }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
