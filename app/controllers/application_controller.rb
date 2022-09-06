class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  before_action :require_login

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  private

  def require_login
    redirect_to splash_index_path if !current_user && (request.url == root_url)
  end
end
