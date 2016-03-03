class UserMailer < ApplicationMailer
    default from: "freshobstuser@yahoo.com"
    
        def contact_form(email, first_name, message)
            @message = message
            mail(:from => email, 
                :to => 'freshobstuser@yahoo.com',
                :subject => 'A new contact form message from #{first_name}' 
                )
        end
        
    def welcome(user)
        @appname = "FreshObst"
        mail(:to => user.email,
            :subject => "Welcome to #{@appname}!")
    end
end
