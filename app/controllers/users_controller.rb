class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  def activate
    @user = User.find_by_activation_token(params[:activation_token])
    if !!@user
      @user.activated = true
      @user.save
      redirect_to '/session/new'
    else
      render :json => "Your account is not activated, 
      please sign up again to receive activation token again."
    end
  end
  
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new(params[:user])
    render :new
  end

  def edit
    @user = User.new(params[:user])
    render :edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      login
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages.first
      render :new
    end
  end

  def update
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to users_url }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password_digest, :session_token)
    end
end
