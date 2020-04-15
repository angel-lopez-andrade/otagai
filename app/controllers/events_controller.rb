class EventsController < ApplicationController
    def new
        @group = Group.find(params[:id])
    end
end