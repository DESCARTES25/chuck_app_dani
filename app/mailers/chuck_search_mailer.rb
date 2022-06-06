class ChuckSearchMailer < ApplicationMailer
    default from: 'inspiringbenchuck@gmail.com'

    def welcome_email(email_address)
      
      mail(to: email_address, subject: 'Welcome to My Awesome Site')
    end
end
