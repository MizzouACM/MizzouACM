class UsersController < ApplicationController
  before_filter :user_must_be_admin, :except => [:index, :show, :search]

  def index
    @users = User.all
  end

  def search
      @skills = params[:skill]
      @users = User.all
      if @skills
        @skills = @skills.split(",")
        if @skills
          @skills = @skills[0]
        end
        @skills = @skills.select{|skill| skill.length > 0}
        @skills.each do |skill|
          @users = @users.select { |user| user.skills.map {|e| e.name }.include? skill }
        end
        if @users.empty?
          flash[:info] = "No members matched your search."
        end
      end
      render :index
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
    @repos = @user.repos.sort {|x,y| y.watchers <=> x.watchers}
  end

end
