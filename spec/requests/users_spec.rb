require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /account" do
    it "returns http success" do
      get "/users/account"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /profile" do
    it "returns http success" do
      get "/users/profile"
      expect(response).to have_http_status(:success)
    end
  end

end
