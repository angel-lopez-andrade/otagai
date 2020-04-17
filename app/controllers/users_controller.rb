class UsersController < ApplicationController
    before_action :setup_whitelisted_params, only: [:create, :edit, :update]

    def show
        @user = User.find(params[:user_id])
    end

    def new
    end

    def create
    end

    def edit
    end
    
    def update
    end

    private
    def setup_whitelisted_params
        whitelisted_params = params.require(:user).permit(:email, :encrypted_password, :description, :gender, :age, :group_id, :username)
    end
end