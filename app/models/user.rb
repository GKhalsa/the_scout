class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.name =  auth_info[:info][:name]
      new_user.uid = auth_info[:uid]
      new_user.email =  auth_info[:info][:email]
      new_user.token = auth_info[:credentials][:token]
      new_user.refresh_token = auth_info[:credentials][:refresh_token]
      new_user.expires_at = auth_info[:credentials][:expires_at]
      new_user.expires = auth_info[:credentials][:expires]
    end
  end

end
