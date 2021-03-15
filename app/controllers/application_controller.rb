class ApplicationController < ActionController::Base
  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :is_logged_in_user?

  def current_user    
    User.find_by(id: session[:user_id])  
  end

  def logged_in?
    !current_user.nil?
  end

  def is_logged_in_user?(user_id)
    current_user.id == user_id  
  end

end
