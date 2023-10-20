# ApplicationController is the base controller class for your Ruby on Rails application.
# It provides common configurations, CSRF protection, and customization for Devise.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  # Redirects the user to the groups_path after successful sign-in.
  def after_sign_in_path_for(_resource)
    groups_path(current_user)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
