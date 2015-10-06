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
