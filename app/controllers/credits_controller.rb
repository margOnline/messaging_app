class CreditsController < ApplicationController
  
  def new

    @cart = params[]
    @amount = cart.total

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => current_user.id,
      :amount      => @amount,
      :description => 'Twilio Stripe customer',
      :currency    => 'gbp'
    )


    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to '/'  
  end

end
