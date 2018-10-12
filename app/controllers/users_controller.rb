class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = t('users.success_create')
      auto_login(@user)
      redirect_to root_path
    else
      flash.now[:danger] = t('users.fail_create')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
