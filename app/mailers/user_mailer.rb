class UserMailer < ApplicationMailer
    default from: "freshobstuser@yahoo.com"
    
        def contact_form(email, name, message)
            @message = message
            mail(:from => email, 
                :to => 'freshobstuser@yahoo.com',
                :subject => 'A new contact form message from #{name}' 
                )
        end
    end
