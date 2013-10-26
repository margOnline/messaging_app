class MessagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message].permit(:phone, :body))

    if @message.valid?
      @message.send_message
      flash[:notice] = 'Message sent'
      redirect_to '/'
    else
      render 'index'     
    end
  end

    
  # rescue Message::SendFailure
  #   flash[:error] = 'Something went wrong'
  #   redirect_to '/'
  # end

end


