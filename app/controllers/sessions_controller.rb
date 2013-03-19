class SessionsController < ApplicationController

  def new
    if Rails.env.production?
      redirect_to '/auth/github'
    else
      redirect_to '/auth/developer'
    end
  end


  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    
    redirect_to root_url, :notice => 'Signed in!'

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
