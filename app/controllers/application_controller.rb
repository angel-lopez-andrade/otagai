class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #All endpoints require login
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit :sign_up, keys: [:username, :description, :gender, :age, :group, :picture]
        devise_parameter_sanitizer.permit :sign_in, keys: [:username, :description, :gender, :age, :group, :picture]
        devise_parameter_sanitizer.permit :account_update, keys: [:username, :description, :gender, :age, :group, :picture]
    end
end
