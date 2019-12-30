class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def search
    end
end