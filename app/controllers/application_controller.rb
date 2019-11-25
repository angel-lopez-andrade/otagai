class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #All endpoints require login
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit :sign_up, keys: [:username]
        devise_parameter_sanitizer.permit :sign_in, keys: [:username]

    end
end
