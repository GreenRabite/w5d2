class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :log_in?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def log_out
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def log_in?
    current_user ? true : false
  end

  def require_log_in
    redirect_to new_session_url unless log_in?
  end
end
