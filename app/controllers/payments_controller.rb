class PaymentsController < ApplicationController
  def create
  	@product = Product.find(params[:product_id])
  	@user = current_user

  	# Get the credit card details submitted by the form
  	token = params[:stripeToken]
  
  	# Create the charge on Stripe's servers - this will charge the user's card
  	begin
    	charge = Stripe::Charge.create(
      	:amount => 1000, # amount in pence, again
      	:currency => "gbp",
      	:source => token,
      	:description => params[:stripeEmail]
    	)

    	if charge.paid
    		Order.create(
    			:product_id => @product_id,
    			:user_id => @current_user.id
    			:total => @product.price
    		}
			end

  	rescue Stripe::CardError => e
    	# The card has been declined
    	body = e.json_body
    	err = body[:error]
    	flash[:error] = "Apologies, there appears to have been an error processing your payment: #{err[:message]}"
		end    	

  redirect_to payments_thank_you_path
	end
end
