class UserRegistrationsController < Devise::RegistrationsController
    before_filter :configure_permitted_parameters

    def create
        super
        if resource.persisted?
            UserMailer.welcome(resource).deliver_now
        end
    end


    protected

    # my custom fields are :name, :heard_how
    def configure_permitted_parameters
    	devise_parameter_sanitizer.for(:sign_up) do |u|
      	u.permit(:first_name, :last_name,
        :email, :password, :password_confirmation)
    end
    
    devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, 
        :email, :password, :password_confirmation, :current_password)
    end
  end
end