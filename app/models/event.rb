class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name

  validates_presence_of :date, :description, :location, :name

end
