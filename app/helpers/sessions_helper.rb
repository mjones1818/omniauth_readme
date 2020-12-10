module SessionsHelper

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find_by(id: logged_in?)
  end
end
