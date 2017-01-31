class SessionsController < ApplicationController
  def create
    name = auth_hash["info"]["name"]
    auth_hash["uid"]
    token = auth_hash["credentials"]["token"]
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
