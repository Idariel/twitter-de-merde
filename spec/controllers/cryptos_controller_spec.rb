require 'rails_helper'

RSpec.describe CryptosController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #scrap" do
    it "returns http success" do
      get :scrap
      expect(response).to have_http_status(:success)
    end
  end

end
