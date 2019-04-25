class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :admin_only

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end

	private

  def after_sign_in_path_for(resource)
     # After you enter login info and click submit, I want you to be sent to the registrations#show page
     profile_path
  end

  def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
  end
end
