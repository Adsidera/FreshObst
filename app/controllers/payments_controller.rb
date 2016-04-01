class PaymentsController < ApplicationController
    def create
        @product = Product.find.params[:product_id]
        @user = current_user
        token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
        begin
            charge = Stripe::Charge.create(
              :amount => 2000, # amount in cents, again
              :currency => "euro",
              :source => token,
              :description => params[:stripeEmail]
            )
            
            if charge.paid
                Order.create(
                    product_id: @product,
                    user_id: current_user, 
                    total: @product.price *100
                    )
                flash[:success] = "Thank you for your order"
            end
            
        rescue Stripe::CardError => e
            # The card has been declined
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end
        redirect_to product_path(@product)
    end
end