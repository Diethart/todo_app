class OauthsController < ApplicationController
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      flash[:success] = t('user_sessions.logged_from_provider', provider_name: provider.titleize)
      redirect_to root_path
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        flash[:success] = t('user_sessions.logged_from_provider', provider_name: provider.titleize)
        redirect_to root_path
      rescue
        flash[:danger] = t('user_sessions.failed_logged_from_provider', provider_name: provider.titleize)
        redirect_to root_path
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
