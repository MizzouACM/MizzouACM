class SkillsController < ApplicationController

  before_filter :user_must_be_current_user

  def create
    @user = User.find(params[:user_id])
    @new_skill = @user.skills.new(params[:skill])
    if @new_skill.save
      flash[:success] = "#{@new_skill.name} was successfully added to your skills."
      redirect_to @user
    else
      render 'users/show'
    end
  end
  def destroy
    user = User.find(params[:user_id])
    skill = user.skills.find(params[:id])
    if skill.destroy
      flash[:alert] = "#{skill.name} has been removed from your skills."
    end
    redirect_to user
  end
end