class SessionsController < ApplicationController
  skip_before_action :ensure_user_signed_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid Login! Please Retry..."
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to root_path
  end
end
