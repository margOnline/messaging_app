class SendMessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def send
    number_to_send_to = params[:phone]
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_Phone_number = ENV['TWILIO_PHONE_NUMBER']

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "Twilio message to be sent to #{number_to_send_to}"
      )

    flash.notice = 'Your message has been sent'
    redirect_to '/'
  end
end
