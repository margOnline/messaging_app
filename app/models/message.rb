class Message < ActiveRecord::Base

  # include ActiveModel::Validations
  # include ActiveModel::Conversion
  # extend ActiveModel::Naming

  # attr_accessor :phone, :body

  validates :phone, presence: true
  validates :body, presence: true
  
  # def initialize(attributes = {})
  #   return false if attributes.blank?
  #   attributes.each do |name,value|
  #     send("#{name}=", value)
  #   end
  # end

  def send_message
    number_to_send_to = phone
    twilio_sid = 'ACaf6af8863d70c2c6aa4c77579e7bced6'
    twilio_token ='c5251c8b4e84b6e0ae478cb4712bd391'
    twilio_phone_number = '1903683040'

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.account.sms.messages.create(
      :from => "+44#{twilio_phone_number}",
      :to => phone,
      :body => body
      )
  end

  def persisted?
    false
  end

end




