class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :admin_only, :require_login

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end

	def require_login
    unless current_user
      redirect_to root_url
    end
  end

	private

  def after_sign_in_path_for(resource)
     # After you enter login info and click submit, go to lessons#index page
     skills_path
  end

  def after_sign_out_path_for(resource_or_scope)
     lessons_path
  end
end
