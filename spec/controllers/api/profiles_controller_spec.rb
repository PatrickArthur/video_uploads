require 'spec_helper'

describe Api::ProfilesController do

  before(:each) do
    @user = create(:user_profile)
    sign_in @user
  end

  describe "GET 'post_inputs' " do
    it "returns a successful 200 response" do
      post :profile, format: :json
      expect(response).to be_success
    end
  end
end
