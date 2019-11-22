class ApplicationController < ActionController::Base
    #All endpoints require login
    before_action :authenticate_user!
end
