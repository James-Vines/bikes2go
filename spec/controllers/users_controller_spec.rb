require 'rails_helper'

describe UsersController, :type => :controller do

	let(:user) {FactoryGirl.create(:user) }
	let(:user_2) {FactoryGirl.create(:user) }

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