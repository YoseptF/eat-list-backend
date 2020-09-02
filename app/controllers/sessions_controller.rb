class SessionsController < ApplicationController
  def create
    user = User
      .where(email: user_params['email']).take
      .try(:authenticate, user_params['password'])

    if user
      session[:user_id] = user.id
      render json: {
        user: user.safe
      }, status: :ok
    else
      render json: {
        message: "the user doesn't exist"
      }, status: :unauthorized
    end
  end

  def logged_in
    render json: {
      logged_in: !current_user.nil?,
      user: current_user.safe
    }.delete_if { |_key, value| value.nil? }, status: :ok
  end

  def logout
    reset_session
    render json: {
      logged_out: true
    }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
