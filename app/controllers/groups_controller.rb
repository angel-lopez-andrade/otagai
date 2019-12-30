class GroupsController < ApplicationController
    before_action :permit_search_params

    def index
        if !@search_params[:duration] and !@search_params[:workout_focus] and !@search_params[:gender]
            @groups = Group.all
        else
            @groups = Group.where(duration: @search_params[:duration], workout_focus: @search_params[:workout_focus], gender: @search_params[:gender].downcase)
        end
    end

    private
    def permit_search_params
        @search_params = params.fetch(:form, {}).permit(:workout_focus, :duration, :gender)
    end
end