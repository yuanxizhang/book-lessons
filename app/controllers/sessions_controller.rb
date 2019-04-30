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
end
