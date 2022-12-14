# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_for_paper_trail
    current_user ? current_user.id : 'Public user'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username email password password_confirmation]
                                     )
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login password password_confirmation]
                                     )
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username email password_confirmation current_password]
                                     )
  end
end
