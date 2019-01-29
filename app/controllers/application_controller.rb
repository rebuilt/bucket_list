class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :header

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
end
