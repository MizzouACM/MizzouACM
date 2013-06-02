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

    # Must create the new skill for the form this way,
    # otherwise it is added as an empty skill to @user.skills
    @new_skill = Skill.new
    @new_skill.user_id = @user.id
  end

end
