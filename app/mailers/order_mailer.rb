class OrderMailer < ApplicationMailer

  def confirm_mail(user, order)
    @user = user
    for i in (1..@user.orders.last.items.size) do
      attachments[@user.orders.last.items[i-1].image_url] = File.read('app/assets/images/'+@user.orders.last.items[i-1].image_url)
    end

    mail(
      from: "chatonstrognons@gmail.com",
      to: @user.email,
      subject: "lol, ta commande a été enregistrée !"
    )
  end


  def confirm_mail_admin(user, order)
    @user = user
    @order = order
    @order_price = 0
    @order.items.each do |s| @order_price+=s[:price] end

    mail(
      from: "chatonstrognons@gmail.com",
      to: "adminchatons@yopmail.com",
      subject: "ça y est vous êtes encore plus riche"
    )
  end

end
#    delivery_method_options: { api_key: ENV['MAILJETAPIKEY'], secret_key: ENV['MAILJETSECRETKEY'] }
