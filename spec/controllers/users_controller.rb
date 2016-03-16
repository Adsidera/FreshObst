require 'rails_helper'

describe UsersController do
    
    before do
        @user = User.create!(email: "testuser@test.it", password: "12345678")
        @user1 = User.create!(email: "testuser1@test.it", password: "98765432")
    end
    
    describe "GET #show" do
        # Test to check if logged user sees pages of other users
        context "User is logged in" do
            before do #before condition user should be logged
                sign_in @user #devise helper
            
            end
            it "loads correct user details" do #spec
                get :show, id: @user.id  #loads page with id of user
                expect(assigns(:user)).to eq @user #expects the assigned user to be equal to the logged user 
            end
            
        end
        # Context block when user is not logged in
        context "No user is logged in" do 
            it "redirects to login" do # spec action
                get :show, id: @user.id
                expect(response).to redirect_to(root_path) #expected response of redirecting to root
            end #end of spec block
        end #end of context block
        
    end
    
   
  describe "GET Unauthorized page" do
    before do
      sign_in(@user)
    end

    
    context "Attempt to access show page of usertwo" do
      it "redirects to login" do 
        get :edit, id: @user1.id
        expect(response).to redirect_to(root_path)
      end
    end
  end
end