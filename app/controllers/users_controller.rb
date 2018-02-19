class UsersController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render action: "new"
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id), notice: "Successfully updated"
    else
      render action: "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end 

  private

  def set_topic
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :number, :role_id)
  end

end
