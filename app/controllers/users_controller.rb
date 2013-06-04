class UsersController < ApplicationController
  before_filter :user_must_be_admin, :except => [:index, :show]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end


  def show
    @user = User.find(params[:id])
    if @user.skills.empty? and user_is_current_user?
      flash[:info] = "It's not cool to have an empty profile! Post your skills!"
    end
    @new_skill = @user.skills.build
  end

end
