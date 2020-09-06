class SessionsController < ApplicationController
  def create
    user = User
      .where(email: params['user']['email']).take
      .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      render :create, status: :ok
    else
      render json: {
        message: "the user doesn't exist"
      }, status: :unauthorized
    end
  end

  def logged_in
    render :logged_in, status: :ok
  end

  def logout
    reset_session
    render json: {
      logged_out: true
    }, status: :ok
  end
end
