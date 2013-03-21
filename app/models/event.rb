class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name

  validates_presence_of :date, :description, :location, :name

  validate :event_date_cannot_be_in_the_past

  def event_date_cannot_be_in_the_past
    if date and date < DateTime.now
      errors.add(:date, "can't be in the past")
    end
  end

end
