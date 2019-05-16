class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'Logged in!'
    else
      flash.now.alert = 'The username and password you entered did not match our records. Please double-check and try again.'
      render :new
    end
  end

  def destroy
    if user_signed_in?
      session.delete :user_id
      redirect_to root_url
    end
  end

  def google_auth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    session[:user_id] = user.id
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to user_path(user)
  end
end
