class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  helper_method :logged_in?, :current_user

  def default_url_options
    { locale: I18n.locale }
  end

  def logged_in?
    session[:user_id].present?
  end

  def ensure_authenticated
    redirect_to login_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
