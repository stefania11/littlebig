class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to prompts_path, notice: "You have created yo' self!"
      session[:user_id] = @user.id
    else
      # TODO: refactor; put custom messages in the model & simplify our rendering of notices
      if @user.errors.messages == {:password=>["can't be blank"]}
        flash[:notice] = "Please enter a password."
      elsif @user.errors.messages == {:email=>["has already been taken"]}
        flash[:notice] = "That email has already been taken."
      elsif @user.errors.messages == {:password_confirmation=>["doesn't match Password"]}
        flash[:notice] = "Password does not match."
      elsif @user.errors.messages == {:password=>["is too short (minimum is 6 characters)"]}
        flash[:notice] = "Passwords must be at least 6 characters long."
      elsif @user.errors.messages == {:password_confirmation=>["doesn't match Password"], :email=>["has already been taken"], :password=>["is too short (minimum is 6 characters)"]}
        flash[:notice] = "Please try again."
      else
        flash[:notice] = @user.errors.messages
      end
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Updated successfully!'
    else
      render 'edit', alert: 'Unable to update... try again.'
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path, notice: "You deleted yo' self"
    else
      redirect_to @user, alert: 'Unable to destroy... try again.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
