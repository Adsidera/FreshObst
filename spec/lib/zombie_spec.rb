require "spec_helper"
require "zombie"

describe Zombie do
#    it "is named Ash"
#    
#    zombie = Zombie.new
#    zombie.name.should == "Ash" 
    
    it "has no brains" do
        zombie = Zombie.new
        zombie.brains.should < 1
    end
end