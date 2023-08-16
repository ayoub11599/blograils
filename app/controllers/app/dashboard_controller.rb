module App
    class DashboardController < ApplicationController
        before_action :guest
        def index
        end
    end
end