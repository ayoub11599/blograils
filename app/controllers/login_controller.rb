class LoginController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present? && @user.password == params[:password]
            session[:user_id] = @user.id
            redirect_to app_dashboard_path
        else
            flash.now[:danger] = "L'adresse email ou le mot de passe n'est pas correct"
            render :new, status: :unprocessable_entity
        end
    end

end