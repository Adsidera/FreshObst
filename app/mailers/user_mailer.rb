class UserMailer < ApplicationMailer
    default from: "freshobstuser@gmail.com"
    
        def contact_form(email, name, message)
            @message = message
            mail(:from => email, 
                :to => 'freshobstuser@gmail.com',
                :subject => 'A new contact form message from #{name}' 
                )
        end
    end
