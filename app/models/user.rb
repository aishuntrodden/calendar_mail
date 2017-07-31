class User < ApplicationRecord
	  def self.from_omniauth(auth)
	  	byebug
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
     user.refresh_token = auth.credentials.refresh_token
     user.email = auth.info.email

      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    byebug
    end
  end


 def to_params
 	byebug
    { 'refresh_token' => refresh_token,
      'client_id'     => '1058339180581-et1k3u81ll6ji8q27bs3q777u1do8tdc.apps.googleusercontent.com',
      'client_secret' => 'vn-Aa97wDFInTxxz7cAgl6RD',
      'grant_type'    => 'refresh_token'}
end
  def refresh!
  	byebug
    data = JSON.parse(request_token_from_google.body)
    update_attributes(
      oauth_token: data['access_token'],
      oauth_expires_at: Time.now + data['expires_in'].to_i.seconds
    )
	end
	def request_token_from_google
	    url = URI("https://accounts.google.com/o/oauth2/token")
	    Net::HTTP.post_form(url, self.to_params)
	end
end
