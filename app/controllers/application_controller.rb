class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  around_filter :set_time_zone
  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :street, :city,:state, :country, :zipcode, :age, :height, :dob, :email, :password, :password_confirmation])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:role, :street, :city,:state, :country, :zipcode, :age, :height, :dob, :email, :password, :password_confirmation])
	end

  private

  def set_time_zone
    p old_time_zone = Time.zone
    p timezone = cookies[:timezone]
    p Time.zone = timezone if timezone.present?
    yield
  ensure
    p Time.zone = old_time_zone
  end
end
