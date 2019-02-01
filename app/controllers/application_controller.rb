class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :header, :current_user

  def logged_in?
    session[:user_id].present?
  end

  def header
    if logged_in?
      render partial: 'authenticated_user_header'
    else
      render partial: 'anonymous_user_header'
    end
  end

  def current_user
    return @current_user if @current_user.present?

    @current_user = User.find(session[:user_id])
  end

  private

  def ensure_authenticated
    redirect_to login_path unless logged_in?
  end
end
