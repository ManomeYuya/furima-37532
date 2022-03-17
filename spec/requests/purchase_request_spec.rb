require 'rails_helper'

RSpec.describe "Purchases", type: :request do

  describe "GET /management" do
    it "returns http success" do
      get "/purchase/management"
      expect(response).to have_http_status(:success)
    end
  end

end
