require 'rails_helper'

describe UsersController, :type => :controller do

	let(:user) { User.create!(email: "user@bikes2do.com", password: "123456") }
	let(:user_2) {User.create!(email: "user2@bikes2go.com", password: "789012") }

	describe "GET #show" do
		context "User is logged in" do
			before do
				sign_in user
			end
			it "loads correct user details" do
				get :show, id: user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user
			end
		end

		context "user cannot access other users show page" do
			it "redirects to login" do
				get :show, id: user_2.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to('/login')
			end
		end

		context "No user is logged in" do
			it "redirects to login" do
				get :show, id: user.id
				expect(response).to redirect_to('/login')
			end
		end
	end
end