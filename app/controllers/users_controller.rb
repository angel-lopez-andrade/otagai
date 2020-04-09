class UsersController < ApplicationController
    before_action :setup_whitelisted_params, only: [:create, :edit, :update]

    def show
        p "paramsss = #{params[:id]}"
        @user = User.find(params[:id])
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
    # Permission security only really necessary for receiving forms with user-inputted data like 'create' (thus, 'show' omitted from checking)
    def setup_whitelisted_params
        whitelisted_params = params.require(:user).permit(:email, :encrypted_password, :description, :gender, :age, :group_id, :username)
    end
end