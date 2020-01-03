class GroupsController < ApplicationController
    before_action :permit_search_params

    def index
        if !params[:form]
            @groups = Group.all
        else
            all_matches = Group.all
            if @search_params[:duration]
                duration_matches = Group.where(duration: @search_params[:duration])
            end
            if @search_params[:workout_focus]
                workout_focus_matches = Group.where(workout_focus: @search_params[:workout_focus])
            end
            if @search_params[:gender]
                gender_matches = Group.where(gender: @search_params[:gender].downcase)
            end
            all_matches = all_matches.merge duration_matches if duration_matches
            all_matches = all_matches.merge workout_focus_matches if workout_focus_matches
            all_matches = all_matches.merge gender_matches if gender_matches
            @groups = all_matches
        end
    end

    private
    def permit_search_params
        @search_params = params.fetch(:form, {}).permit(:workout_focus, :duration, :gender)
    end
end