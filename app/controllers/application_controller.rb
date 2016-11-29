class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #call configure permitted params, if we are using the devise controller
  before_action :configure_permitted_paramaters, if: :devise_controller?
  
  #redirect our user after sign in
  def after_sign_in_path_for(resource)
    "/home"
  end
  
  #after signing out
  def after_sign_out_path_for(resource_or_scope)
    "/"
  end
  
  #protect the database , while allowing fields these fields to be updated
  protected
  def configure_permitted_paramaters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
  end
    
end
