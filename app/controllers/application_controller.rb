class ApplicationController < ActionController::Base
    add_flash_types :success, :danger, :warning
    helper_method :authenticated_user
    protect_from_forgery with: :exception

    def authenticated_user
        @authenticated_user ||= User.find_by(id: session[:user_id])
    end

    def authenticated
        if authenticated_user
            redirect_to app_dashboard_path
        end
    end

    def guest
        if !authenticated_user
            redirect_to auth_login_path
        end
    end
end
