require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) { { email: 'test@mail.ru', password: 'test123', password_confirmation: 'test123' } }
  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end
    end
  end
end
