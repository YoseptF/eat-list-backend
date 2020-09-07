class UsersController < ApplicationController
  def update_current
    p user_params
    success = current_user&.update(user_params)

    if success
      render json: {
        updated: true,
        user: current_user
      }, status: :ok
    else
      render json: {
        message: "you're not logged in"
      }, status: :unauthorized
    end
  end

  def update_current_image
    success = current_user&.avatar&.update(url: params['user']['url'])

    if success
      render json: {
        updated: true,
        avatar: current_user.avatar
      }, status: :ok
    else
      render json: {
        message: "you're not logged in"
      }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :age,
      :height,
      :weight,
      :lifestyle,
      :daily_water,
      :daily_sleep,
      :daily_sitting
    )
  end
end
