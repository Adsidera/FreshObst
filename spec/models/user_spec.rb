require "rails_helper"

#test if validation of email address works fine
describe User, :type => :model do
  it "should not validate without an email address" do
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
end


