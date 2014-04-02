class Api::SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  
  def new
    
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
    else
      render :json => {}, status: :unauthorized
    end
  end

  def destroy
    sign_out
    render json: { status: "Signed Out" }
  end
end