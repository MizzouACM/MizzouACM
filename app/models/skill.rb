class Skill < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
  validates :name, :uniqueness => {:scope => 'user_id', :message=> 'You cannot add the same skill twice.'}
  def self.valid_skills
    {
    'Android' => "android.png",
    'Apple' => "apple.jpg",
    'C' => "c.png",
    'C++' => "CPlusPlus.jpg",
    'CSS' => "css.png",
    'Drupal' => "drupal.png",
    'Firefox' => "firefox.png",
    'Google Chrome' => "chrome.jpg",
    'HTML' => "html.png",
    'Java' => "java.png",
    'jQuery' => "jQuery.png",
    'Linux' => "linux.jpg",
    'Node.js' => "nodejs.png",
    'PHP' => "php.jpg",
    'Python' => "python.png",
    'Ruby on Rails' => "rails.png",
    'Ruby' => "ruby.png",
    'Windows' => "windows.png",
    'Wordpress' => "wordpress.png"
  }
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
