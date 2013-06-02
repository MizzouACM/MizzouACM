class HomeController < ApplicationController
  def index
    events = Event.all
    users = User.all
    @feed = (events + users).sort_by(&:created_at)
  end
end
