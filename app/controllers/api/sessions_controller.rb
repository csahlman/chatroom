class Api::SessionsController < ApplicationController
  skip_before_filter :authenticate_user


  def new
    
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    puts @user
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
    else
      render :json => {}, status: :unauthorized
    end
  end

  # def create
  #   @user = User.find_by_email(params[:email])
  #   if @user && @user.authenticate(params[:password])
  #     if @user.confirmed? 
  #       sign_in @user
  #       redirect_to dashboards_path, success: "Successfully signed in"
  #     else
  #       flash.now[:error] = "Account not confirmed, please click 
  #         below to resend instructions"
  #       render :new
  #     end
  #   else
  #     flash.now[:error] = "There was an error logging in" 
  #     render :new
  #   end
  # end

  def destroy
    sign_out
    render json: { status: "Signed Out" }
  end
end