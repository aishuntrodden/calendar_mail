require 'gmail_xoauth'
require 'gmail'
require 'google/apis/gmail_v1'
#require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'mail'
#require 'mail-xaouth'
  
require 'json'
require 'net/smtp'
require 'fileutils'


class SessionsController < ApplicationController
  def create
user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_auth_token] = user.oauth_token
#      imap = Net::IMAP.new('imap.googlemail.com', 993, usessl = true, certs = nil, verify = false)
#     byebug

# 	imap.authenticate('XOAUTH2', 'aishwary.athlete@gmail.com', user.oauth_token)
# 	 xmessages_count = imap.status('INBOX', ['MESSAGES'])['MESSAGES']
# 	 #puts "Seeing #{messages_count} messages in INBOX"
# 	 #gmail = Gmail.new(:xoauth2, 'aishwary.athlete@gmail.com', ' user.oauth_token')
#    # gmail = Gmail.connect("aishwary.athlete@gmail.com","untroddenaish")
#      puts xmessages_count
#      #report = { bot: 1138, temp: 42, flux: 10 }

# # options = { :address              => "smtp.gmail.com",
# #             :port                 => 587,
# #             :user_name            => 'aishwary.athlete@gmail.com',
# #             :password             => 'untroddenaish',
# #             :authentication       => 'plain',
# #             :enable_starttls_auto => true  }

# # Mail.defaults do
# #   delivery_method :smtp, options
# # end
# # Mail.deliver do
# #        to 'aishwary.athlete@gmail.com '
# #      from 'aishwary.athlete@gmail.com '
# #   subject 'Test'
# #      body 'Hurray!!! Test email!'
# # end
# smtp = Net::SMTP.new('smtp.gmail.com', 587)
# smtp.enable_starttls_auto

# smtp.start('gmail.com', 'aishwary.athlete@gmail.com', user.oauth_token, :xoauth2)
# # Mail.defaults do
# #    delivery_method :smtp
# #  end
# #  byebug
# # Mail.deliver do
# #   to 'aishwary.athlete@gmail.com'
# #   from 'aishwary.athlete@gmail.com'
# #   subject 'Token'
# #   body 'Hurray!!! Test email!'
# # end
# smtp.finish

#   smmtp = Net::SMTP.new('smtp.gmail.com', 587)
#   smmtp.enable_starttls_auto
#   smmtp.start('gmail.com', 'aishwary.athlete@gmail.com', user.oauth_token, :xoauth2)
#   message = "\ 
#   From: Your Name <your@mail.address>\
#   To: Destination Address <someone@example.com>\
#   Subject: test message\
#   Date: Sat, 23 Jun 2001 16:26:43 +0900\
#   Message-Id: <unique.message.id.string@example.com>\
#   \
#   This is a test message."

#   smmtp.send_message message, 'aishwary.athlete@gmail.com', 'aishwary.athlete@gmail.com'
#   smmtp.finish
#     #puts  gmail.inbox.count
    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

#user.oauth_token








end