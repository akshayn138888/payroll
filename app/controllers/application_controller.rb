class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :street, :city,:state, :country, :zipcode, :age, :height, :dob, :email, :password, :password_confirmation])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:role, :street, :city,:state, :country, :zipcode, :age, :height, :dob, :email, :password, :password_confirmation])
	end
end
