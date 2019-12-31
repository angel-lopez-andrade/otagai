class GroupsController < ApplicationController
    before_action :permit_search_params

    def index
        #better way to combine activerecord relations? - 31/12
        if !params[:form]
            @groups = Group.all
        else
            all_matches = Group.none
            if @search_params[:duration]
                duration_matches = Group.where(duration: @search_params[:duration])
                all_matches = all_matches.or duration_matches
            end
            if @search_params[:workout_focus]
                workout_focus_matches = Group.where(workout_focus: @search_params[:workout_focus])
                all_matches = all_matches.or workout_focus_matches
            end
            if @search_params[:gender]
                gender_matches = Group.where(gender: @search_params[:gender].downcase)
                all_matches = all_matches.or gender_matches
            end
            @groups = all_matches
        end
    end

    private
    def permit_search_params
        @search_params = params.fetch(:form, {}).permit(:workout_focus, :duration, :gender)
    end
end