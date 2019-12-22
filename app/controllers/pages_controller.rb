class PagesController < ApplicationController
    def home
        @group= Group.new
    end
end