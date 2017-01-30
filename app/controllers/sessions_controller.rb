class SessionsController < ApplicationController
  def create
    byebug
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
