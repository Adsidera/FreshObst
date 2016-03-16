class UserMailer < ApplicationMailer
    default from: "freshobstuser@gmail.com"
    
        def contact_form(email, first_name, message)
            @message = message
            mail(:from => email, 
                :to => 'freshobstuser@gmail.com',
                :subject => 'A new contact form message from #{first_name}' 
                )
        end
        
    def welcome(user)
        @user = user
        @appname = "FreshObst"
        mail(:to => @user.email,
            :subject => "Welcome to #{@appname}!")
    end
end
