require 'spec_helper'

describe UsersController do
  #subject (:me) { User.create!(FactoryGirl.attributes_for(:me)) }
  subject (:me) { FactoryGirl.create(:me) }
  
  context "POST" do
    it "can create user" do
      expect(User.count).to eq(0)
      post :create, {user: FactoryGirl.attributes_for(:me), format: :json}
      expect(response).to be_success
      expect(User.count).to eq(1)
    end
  end

  context "GET" do
    it "can get user" do
      get :show, id: me.id, format: :json
      data = JSON.parse(response.body)
      expect(response).to be_success
      expect(data["first_name"]).to eq(me.first_name)
    end
  end
end