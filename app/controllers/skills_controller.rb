class SkillsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    user.skills.create(params[:skill])
    redirect_to user_path(user)
  end
end