class Skill < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
  validates :name, :uniqueness => {:scope => 'user_id', :message=> 'You cannot add the same skill twice.'}
  def self.valid_skills
    {'Web Dev'=>"web.png", 'C++'=>"cplusplus.png", 'JavaScript'=>"js.png"}
  end

  def self.valid_skills_dropdown
    ['Select a new skill to add'] + valid_skills_keys
  end
  def self.valid_skills_keys
  	self.valid_skills.keys
  end
  validates_inclusion_of :name, :in => self.valid_skills_keys
  def self.getIcon(skill)
  	return self.valid_skills[skill]
  end
end
