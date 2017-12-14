class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    auth_token = AuthenticateUser.new(authentication_params[:email], authentication_params[:password]).call
    render json: {auth_token: auth_token}, status: :ok
  end

  private

  def authentication_params
    params.permit(:email, :password)
  end
end
