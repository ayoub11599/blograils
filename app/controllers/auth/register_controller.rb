module Auth
    class RegisterController < ApplicationController
        layout "auth_layout"
        before_action :authenticated
        def new
            @user = User.new
            @is_login_page = false
        end
    
        def create
            @user = User.new(register_params)
            if @user.save
                redirect_to auth_login_path, success: "Le compte est créé avec succès, veuillez se connecter maintenant"
            else
                render :new, status: :unprocessable_entity
            end
        end
    
        private
    
        def register_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end
    end
end