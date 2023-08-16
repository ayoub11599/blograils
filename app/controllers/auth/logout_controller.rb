module Auth
    class LogoutController < ApplicationController
    
        def destroy
            session[:user_id] = nil
            redirect_to auth_login_path
        end
    
    end
end