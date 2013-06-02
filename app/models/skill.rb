class Skill < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name

  def self.valid_skills
    ['Web Dev', 'C++', 'JavaScript']
  end

  validates_inclusion_of :name, :in => self.valid_skills

end
