class Hack < ActiveRecord::Base
  attr_accessible :demo, :description, :name, :source

  has_and_belongs_to_many :users
  
end
