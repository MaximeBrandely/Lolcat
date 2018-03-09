class ChargesController < ApplicationController
before_action   :set_description,  :authenticate_user!, :set_order


    def  thanks
    end

    def  new
    end



    def  create
    @order = current_user.orders.last #solution temporaire pour afficher un order
    @amount  =  500
    customer  =  StripeTool.create_customer(email: params[:stripeEmail],
    stripe_token: params[:stripeToken])
    charge  =  StripeTool.create_charge(customer_id: customer.id,
    amount: @amount,
    description: @description)
    if charge["paid"] == true
      OrderMailer.confirm_mail(current_user, @order).deliver_now!
      OrderMailer.confirm_mail_admin(current_user, @order).deliver_now!
       #set order_status to paid
    end


    rescue  Stripe::CardError  => e
    flash[:error]  =  e.message
    redirect_to new_charge_path
    end



    private

    def set_order
      @order = session[:order]
    end

    def  amount_to_be_charged
      @amount  =  order.compute_total
    end



    def  set_description
    @description  =  "Meeeooooowwwwwwww !"
    end

end
