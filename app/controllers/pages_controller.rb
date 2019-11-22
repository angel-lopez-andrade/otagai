class PagesController < ApplicationController
    def home
        render plain: "Test"
    end
end