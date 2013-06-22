class HomeController < ApplicationController
  def index

    # Activity feed that won't scale at all, but will hopefully be fast enough for our needs!
    max_activities = 10
    events = Event.find(:all, :limit => max_activities, :order => 'created_at desc')
    users = User.find(:all, :limit => max_activities, :order => 'created_at desc')
    projects = Project.find(:all, :limit => max_activities, :order => 'created_at desc')
    @feed = (events + users + projects).sort_by(&:created_at)[0,max_activities]
  	@posts = Post.find(:all, :order => 'created_at desc')
  end
end
