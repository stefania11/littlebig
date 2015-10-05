class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to prompts_path, notice: "You have successfully signed in"
    else
      redirect_to root_path, alert: "Your credentials were incorrect, try again"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have successfully logged out!"
  end
end
