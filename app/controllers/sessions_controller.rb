class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #need to correct for when they don't enter a username and/or password
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      p session[:user_id]
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
     session.delete(:user_id)
     redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end