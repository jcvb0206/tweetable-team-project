class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[email username name avatar password]
    devise_parameter_sanitizer.permit :account_update,
                                      keys: %i[email username name avatar password current_password]
  end
end
