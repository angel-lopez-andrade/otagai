class EventsController < ApplicationController
    before_action :parse_datetime_params, :whitelisted_params, only: [:create]
    
    def new
        @group = Group.find(params[:group_id])
    end

    def create
        event = Event.create(
            group_id: params[:group_id],
            user_id: current_user.id,
            date: @datetime,
            description: params[:post][:description],
            name: params[:post][:event_name]
        )
        if params[:picture]
            event.picture.attach(params[:picture])
        end
        redirect_to group_path(params[:group_id])
    end

    def show
        p "#{params[:date]} = params[:date]"
        p "#{Date.strptime(params[:date])} = Modified params[:date] (convert to DateTime)"
        p "#{Event.last.date} = Event.last.date"
        event_timeless_date = Event.last.date.to_s.match(/\d{4}-\d{2}-\d{2}/)
        p "#{event_timeless_date} = event_timeless_date"
        
        @events = Event.where("date like ?", params[:date])
    end

    private
    def parse_datetime_params
        @datetime = Time.new(params[:post]["date_time(1i)"].to_i, params[:post]["date_time(2i)"].to_i, params[:post]["date_time(3i)"].to_i, params[:post]["date_time(4i)"].to_i, params[:post]["date_time(5i)"].to_i)
    end

    def whitelisted_params
        @whitelisted_params = params.require(:post).permit(:event_name, "date_time(1i)", "date_time(2i)", "date_time(3i)", "date_time(4i)", "date_time(5i)", :description, :picture)
    end
end