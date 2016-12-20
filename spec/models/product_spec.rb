require 'rails_helper'

describe Product do

	before do
		@product = Product.create!(name: "race bike", description: "A race bike", image_url: "race_bike.com", price: "10", colour: "red")
		@user = User.create!(email: "user@bikes2do.com", password: "123456")
		@product.comments.create!(rating: 1, user: @user, body: "Awful bike")
		@product.comments.create!(rating: 3, user: @user, body: "Average bike")
		@product.comments.create!(rating: 5, user: @user, body: "Great bike")
	end

	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3
	end

	it "is not valid" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end

end