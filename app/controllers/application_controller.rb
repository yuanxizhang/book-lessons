class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  helper_method :admin_only, :require_login, :user_signed_in?, :current_user

	def current_user
    # The session[:user_id] has been set
    if session[:user_id].present?
      @current_user ||= User.find_by(:id => session[:user_id])
    end
  end

	def admin_only
    unless current_user && current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end

	def require_login
    unless current_user
      redirect_to root_url, notice: 'Please log in.'
    end
  end

	private

	def user_signed_in?
  	# converts current_user to a boolean by negating the negation
  	!!current_user
  end
end
