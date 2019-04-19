class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  helper_method :current_user, :require_login, :admin_only, :user_signed_in?
	before_filter :authenticate

	def authenticate
	  redirect_to :login unless user_signed_in?
	end

	def user_signed_in?
	  !!current_user
	end

	def current_user
	  @current_user ||= begin
	    User.find_by(:id => session[:user_id]) if session[:user_id].present? || fetch_user_from_omniauth
	  end
	end

	def fetch_user_from_omniauth
	  user = User.from_omniauth(env['omniauth.auth'])
	  session[:current_user_id] = user.id
	  user
	end

	def require_login
    unless current_user
      redirect_to root_url
    end
  end

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end
end
