class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      session[:user_id] = user.id
      render json: {
        user: user.safe
      }, status: :ok
    else
      render json: {
        message: "the user couldn't be saved",
        reason: user.errors.full_messages
      }, status: :internal_server_error
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
