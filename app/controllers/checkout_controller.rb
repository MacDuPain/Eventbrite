class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @event_id = params[:event_id]
    @session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [
    {
      price_data: {
        currency: 'eur',
        product_data: {
          name: 'Event Ticket',
          metadata: {
            event_id: @event_id,
            event_title: @event_title
          }
        },
        unit_amount: (@total * 100).to_i
      },
      quantity: 1
    }
  ],
  mode: 'payment',
  success_url: checkout_success_url,
  cancel_url: checkout_cancel_url
)

    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @event_id = @session.metadata.event_id
  end

  def cancel
  end
end
