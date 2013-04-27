class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :email, :avatar

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.avatar = auth['extra']['raw_info']["avatar_url"]
    end
  end

end