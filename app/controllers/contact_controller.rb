class ContactController < ApplicationController
  def index
  end
end

def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email, 
        :to => 'annamaria.costalonga@gmail.com',
        :subject => "A new contact form message from #{@name}",
        :body => @message.deliver_now)
    UserMailer.contact_form(@email, @name, @message).deliver_now
end