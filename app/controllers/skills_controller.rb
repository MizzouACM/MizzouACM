class SkillsController < ApplicationController

#  before_filter :user_must_be_current_user

  def create
    @user = User.find(params[:user_id])
    @new_skill = @user.skills.new(params[:skill])
    if @new_skill.save
      flash[:success] = 'Skill was successfully added.'
      redirect_to @user
    else
      render 'users/show'
    end
  end
  def destroy
    user = User.find(params[:user_id])
    skill = user.skills.find(params[:id])
    skill.destroy
    redirect_to user
  end
end