class Api::UsersController < ApplicationController

  def create
    @user = User.new user_params
    sign_in @user if @user.save
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end

end