class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth[:uid]) do |u|
      u.name = auth.info.nickname
      u.email = auth.extra.email
    end

    if @user
      session[:user_id] = @user.id
    end

    render 'welcome/home'
  end


  def auth
    request.env['omniauth.auth']
  end
end
