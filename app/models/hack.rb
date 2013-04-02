class Hack < ActiveRecord::Base
  attr_accessible :demo, :description, :name, :source

  validates_presence_of :name, :description

  has_and_belongs_to_many :users

end
