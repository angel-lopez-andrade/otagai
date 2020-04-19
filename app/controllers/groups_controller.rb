class GroupsController < ApplicationController
    before_action :permit_search_params, only: [:index]

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

    def show
        @group = Group.find(params[:group_id])
        @group_events = Event.where(group_id: params[:group_id])
        @event_icon_dates = []
        group_events_looper = @group_events.clone
        group_events_looper.each_with_index do |event, i|
            @event_icon_dates.push({
                date: group_events_looper[i].date
                #.strftime("%e")
            })
        end
        @event_icon_dates = @event_icon_dates.uniq { |event_icon_date| event_icon_date[:date]}
        p "!!!#{@event_icon_dates}"
        p "???#{@group_events}"
    end

    private
    def permit_search_params
        @search_params = params.fetch(:form, {}).permit(:workout_focus, :duration, :gender)
    end
end