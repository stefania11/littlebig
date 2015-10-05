class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to prompts_path, notice: "You have created yo' self!"
      session[:user_id] = @user.id
    else
      if @user.errors.messages == {:password=>["can't be blank"]}
        flash[:notice] = "Please enter a password."
      elsif @user.errors.messages == {:email=>["has already been taken"]}
        flash[:notice] = "That email has already been taken."
      elsif @user.errors.messages == {:password_confirmation=>["doesn't match Password"]}
        flash[:notice] = "Password does not match."
      elsif @user.errors.messages == {:password=>["is too short (minimum is 6 characters)"]}
        flash[:notice] = "Passwords must be at least 6 characters long."
      else
        flash[:notice] = @user.errors.messages
      end
      render 'new'
    end
  end



  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
