class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(session_params[:email], session_params[:password])
      flash[:success] = t('user_sessions.logged_in')
      redirect_back_or_to checklists_path
    else
      flash[:danger] = t('user_sessions.login_failed')
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = t('user_sessions.logged_out')
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
