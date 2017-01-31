class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(auth_hash)
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
