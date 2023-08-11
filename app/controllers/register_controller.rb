class RegisterController < ApplicationController
    def new
        @user = User.new
    end

    def store
        @user = User.new(register_params)
        if @user.save
            redirect_to login_path, success: "Le compte est créé avec succès, veuillez se connecter maintenant"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def register_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end