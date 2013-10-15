class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_credentials(email, password)
    if @user.save && @user.activated
      login
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end