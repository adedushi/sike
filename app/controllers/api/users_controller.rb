class Api::UsersController < ApplicationController
    wrap_parameters include: User.attribute_names + ['password']
    
    before_action :require_logged_out, only: [:create]
    
    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            render :show
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def check_email
        email = params[:email].downcase
        exists = User.exists?(email: email)
        render json: { exists: exists }
    end


    private

    def user_params
        params.require(:user).permit(:email.downcase, :password, :first_name, :last_name)
    end
end
