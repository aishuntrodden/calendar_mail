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
@cal = Google::Apis::CalendarV3::CalendarService.new
byebug
@cal.authorization = secrets.to_authorization
byebug
# cal.authorization.refresh!
@cal.list_calendar_lists




page_token = nil
begin
  result = @cal.list_calendar_lists(page_token: page_token)
  result.items.each do |e|
    print e.summary + "\n"
  end
  if result.next_page_token != page_token
    page_token = result.next_page_token
  else
    page_token = nil
  end
end while !page_token.nil?






 parameters = Google::Apis::CalendarV3::Event.new({
      summary: 'Google I/O 2016',
      location: '800 Howard St., San Francisco, CA 94103',
      description: 'A chance to hear more about Google\'s developer products.',
      start: {
        date_time: '2017-08-02T09:00:00-07:00',
        time_zone: 'America/Los_Angeles',
      },
      end: {
        date_time: '2017-08-02T17:00:00-07:00',
        time_zone: 'America/Los_Angeles',
      },
      recurrence: [
        'RRULE:FREQ=DAILY;COUNT=2'
      ],
      attendees: [
        {email: 'lpage@example.com'},
        {email: 'sbrin@example.com'},
      ],
      reminders: {
        use_default: false,
        overrides: [
          # Google::Apis::CalendarV3::EventReminder.new(reminder_method: "popup", minutes: 10),
          # Google::Apis::CalendarV3::EventReminder.new(reminder_method: "email", minutes: 24 * 60),
          {'reminder_method': 'popup', 'minutes': 10},
          {'reminder_method': 'email', 'minutes': 24 * 60}
        ]
      }# cal.list_user_events
})
byebug

result = @cal.insert_event('primary', parameters)
print result.summary

# calendar_params = CalendarServices.create_event
#     @cal = Calendar.create(calendar_params)








end






  private

  def user_specific
    @user = User.find(params[:id])
  end


end
