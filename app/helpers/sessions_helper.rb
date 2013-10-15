module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end
  
  def login
    @user.reset_session_token!
    session[:session_token] = @user.session_token    
  end
  
  def logged_in?
    return false if current_user.nil?
    session[:session_token] == current_user.session_token
  end
  
  def logout!
    current_user.reset_sessions_token!
    session[:session_token] = nil
  end
end