require 'rails_helper'

describe Product do 
	
	before do
		@product = Product.create!(name: "spinaci")
		@user = User.new
		@product.comments.create!(rating:1, user: @user, body: "Bah")
		@product.comments.create!(rating:3, user: @user, body: "Not bad")
		@product.comments.create!(rating:5, user: @user, body: "Wonderful!")
	end
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "is not valid" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	
end