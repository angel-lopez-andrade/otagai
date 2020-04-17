class EventsController < ApplicationController
    before_action :parse_datetime_params, :whitelisted_params, only: [:create]
    def new
        @group = Group.find(params[:group_id])
    end

    def create
        event = Event.new(
            group_id: params[:group_id],
            user_id: current_user.id,
            date: @datetime,
            description: params[:description],
            name: params[:event_name]
        )
        p event
    end

    private
    def parse_datetime_params
        @datetime = Time.new(params["date_time(1i)"].to_i, params["date_time(2i)"].to_i, params["date_time(3i)"].to_i, params["date_time(4i)"].to_i, params["date_time(5i)"].to_i)
    end

    def whitelisted_params
        # @whitelisted_params = 
    end
end