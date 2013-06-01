class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :link, :title, :user_id
end
