require 'net/http'
require 'json'


class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email
  attr_accessible :admin unless Rails.env.production?

  def self.create_with_omniauth(auth)

    # Get github info
    if Rails.env.production?
      info = get_and_save_github_info(auth['uid']) 
    else
      info = auth['info']
    end

    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = info[:name] 
      user.email = info[:email]
    end

  end

  def is_admin?
    admin
  end

  private

  def get_and_save_github_info(token)

    url = URI.parse("api.github.com/users?access_token=#{token}")
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    return JSON.parse(res.body)

  end

end
