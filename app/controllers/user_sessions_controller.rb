class UserSessionsController < ApplicationController

  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(root_path, notice: "Вы успешно вошли")
    else
      flash[:alert] = "Неверный email или пароль"
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: "Вы успешно вышли")
  end
end
