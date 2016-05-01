class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:contactually]

  def self.from_omniauth(auth)
      user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.access_token = auth.credentials['token']
      end
      user.access_token = auth.credentials['token'] #poor man's refresh, I know.
      user.save
      user
  end

  def contactually_api
    @api_client ||=  OAuth2::Client.new(ENV['CONTACTUALLY_APP_ID'], ENV['CONTACTUALLY_APP_SECRET'], :site => 'https://api.contactually.com')
    @access_token ||= OAuth2::AccessToken.from_hash(@api_client, access_token: access_token)     
  end
end
