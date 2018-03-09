require 'mailjet'


class MailJetSender
  def initialize()
#    @user = user
    @mailto = "nicosf4r@gmail.com"
  end

  def perform
    sendemail
  end

  def send_email
      email = { :from_email   => "nicosf4r@gmail.com",
            :from_name    => "Dona Sky",
            :subject      => "Hello",
            :text_part    => "Hi",
            :recipients   => [{:email => @mailto}]
          }

      test = Mailjet::Send.create(email)
      p test.attributes['Sent']
  end


end
