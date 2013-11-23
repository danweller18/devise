class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if params[:controller] == "user"
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :email, :password, :password_confirmation, :current_password)}
    else
      devise_parameter_sanitizer.for(:sign_in) { |a| a.permit(:login, :password, :remember_me) }
      devise_parameter_sanitizer.for(:sign_up) { |a| a.permit()}
      devise_parameter_sanitizer.for(:account_update) {|a| a.permit(:username, :email, :password, :password_confirmation, :current_password)}
    end
  end
end
