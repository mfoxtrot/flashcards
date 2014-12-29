class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  before_action :find_user, only: [:destroy, :edit, :update, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if User.create(user_params)
      redirect_to users_path
    else
      render "new"
    end
  end

  def destroy
    @user.delete
    redirect_to users_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

  def show
  end

  def find_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
