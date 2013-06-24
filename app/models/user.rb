class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :github_username, :admin

  has_many :skills, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  
  def randomSkills(n)
    skills.sample(n)
  end
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.github_username = auth['info']['nickname'] || ""
      end
      user.admin = true unless Rails.env.production?
    end
  end

  def is_admin?
    admin
  end

  def github_url
    'https://github.com/' + github_username
  end

  def gravatar_url(size = 160)
    hash = Digest::MD5.hexdigest(email.downcase)
    "http://www.gravatar.com/avatar/#{hash}?s=#{size}&d=mm"
  end

  # Not everyone has their actual name set in GitHub,
  # So sometimes name is empty.
  # So this method gets name if it exists, or the github name if not
  def display_name
    if name.blank?
      github_username
    else
      name
    end
  end
  def repos
      Github.repos.list user: github_username
  end
end
