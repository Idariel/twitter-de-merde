require 'rails_helper'

RSpec.describe TwitterController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tweet" do
    it "returns http success" do
      get :tweet
      expect(response).to have_http_status(:success)
    end
  end

end