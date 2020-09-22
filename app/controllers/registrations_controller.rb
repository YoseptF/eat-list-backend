class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render :create, status: :ok
    else
      render json: {
        message: "the user couldn't be saved",
        reason: user.errors.full_messages
      }, status: :bad_request
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
