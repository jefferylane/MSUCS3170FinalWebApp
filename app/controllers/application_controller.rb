class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :current_user, :user_signed_in?
  
  def clear_session
    reset_session
    redirect_to root_path, notice: 'Session cleared'
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  # Optional: Helper method for flash messages
  def set_flash_message(type, message)
    flash[type] = message
  end
end
