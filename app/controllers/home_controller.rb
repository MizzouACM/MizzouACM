class HomeController < ApplicationController
  def index
    redirect_to events_path
  end
end
