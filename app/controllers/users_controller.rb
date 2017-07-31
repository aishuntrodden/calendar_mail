class UsersController < ApplicationController
  before_action :user_specific, only: [:show, :update, :list]
require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets'
  def index
  	 @users = User.all
  end

  def show
  end

 
  def update		
   # byebug
    t = @user.oauth_token  
    @user.refresh! if @user.oauth_expires_at < Time.now
    #t.oauth_token
  #  byebug
 		smmtp = Net::SMTP.new('smtp.gmail.com', 587)
	  smmtp.enable_starttls_auto
	#  byebug
	  smmtp.start('gmail.com', @user.email, @user.oauth_token, :xoauth2)
	  message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: #{params[:user][:email]}
MIME-Version: 1.0
Content-type: text/html
Subject: #{params[:user][:email]}
<%byebug%>
This is an e-mail message to be sent in HTML format

<b>This is HTML message.</b>
<h1>This is headline.</h1>
MESSAGE_END

	  
	  smmtp.send_message message,@user.email,params[:user][:to]
	  #byebug
	  smmtp.finish
 # byebug
 
  # redirect_to users_url
  end





def list()
  byebug

  t = @user.oauth_token  
    @user.refresh! if @user.oauth_expires_at < Time.now
  secrets = Google::APIClient::ClientSecrets.new({"web" => { access_token: @user.oauth_token, refresh_token: @user.refresh_token, client_id: '1058339180581-et1k3u81ll6ji8q27bs3q777u1do8tdc.apps.googleusercontent.com', client_secret: 'vn-Aa97wDFInTxxz7cAgl6RD'}})
cal = Google::Apis::CalendarV3::CalendarService.new
byebug
cal.authorization = secrets.to_authorization
byebug
# cal.authorization.refresh!
cal.list_calendar_lists 
# cal.list_user_events
end
  





  private

  def user_specific
    @user = User.find(params[:id])
  end


end

