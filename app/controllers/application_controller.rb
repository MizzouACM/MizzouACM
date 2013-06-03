class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :user_must_be_admin
  helper_method :user_is_admin?
  helper_method :user_is_current_user?
  helper_method :user_must_be_current_user

  private
    def current_user
      begin
        puts session[:user_id]
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        puts e
      end
    end

    def user_signed_in?
      return true if current_user
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

    def user_must_be_admin
      redirect_to root_url, :alert => 'You must be a master hacker do that.' unless current_user and current_user.is_admin?
    end

    def user_is_current_user?
      @user ||= User.find(params[:user_id])
      puts "1"+current_user.to_s
      puts "2"+@user.to_s
      return current_user == @user
    end

    def user_must_be_current_user
      redirect_to user_path(params[:user_id]), :alert => 'Access denied.' unless user_is_current_user?
    end

    def user_is_admin?
      current_user and current_user.is_admin?
    end

end
