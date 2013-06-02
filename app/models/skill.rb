class Skill < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
  validates :name, :uniqueness => {:scope => 'user_id', :message=> 'You cannot add the same skill twice.'}
  def self.valid_skills
    ['Web Dev', 'C++', 'JavaScript']
  end

  def self.valid_skills_dropdown
    ['Select a new skill to add'] + valid_skills
  end
  validates_inclusion_of :name, :in => self.valid_skills

end
