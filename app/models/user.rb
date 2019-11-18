class User < ApplicationRecord::Base
  
  def self.sign_in_from_omniouth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniouth(auth)
  end

  def self.create_user_from_omniouth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
    )
  end
  
end
