class SendMessagesController < ApplicationController

  def index
    @message = Message.new
  end

  # def send
  #   number_to_send_to = params[:phone]
  #   twilio_sid = 'ACaf6af8863d70c2c6aa4c77579e7bced6'
  #   twilio_token ='c5251c8b4e84b6e0ae478cb4712bd391'
  #   twilio_Phone_number = '903683040'

  #   @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
  #   @twilio_client.account.sms.messages.create(
  #     :from => "+1#{twilio_phone_number}",
  #     :to => number_to_send_to,
  #     :body => "Twilio message to be sent to #{number_to_send_to}"
  #     )

  #   flash.notice = 'Your message has been sent'
  #   redirect_to '/'
  # end
end
