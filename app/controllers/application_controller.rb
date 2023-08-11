class ApplicationController < ActionController::Base
    add_flash_types :success, :danger, :warning
    helper_method :authenticated_user

    def authenticated_user
        @authenticated_user ||= User.find_by(id: session[:user_id])
    end
end
