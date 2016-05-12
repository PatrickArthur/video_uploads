# spec/controllers/profiles_controller_spec.rb
require 'spec_helper'

describe ProfilesController do

  before(:each) do
    @user = create(:user_profile)
    sign_in @user
  end

  describe "GET #show" do

    it "shows current users profile" do
      get :show, id: @user.profile.id
      expect(assigns(:profile)).to eq @user.profile
    end

    it "renders the :show view" do
      get :show, id: @user.profile.id
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new profile" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new contact" do
        expect{
          post :create, profile: FactoryGirl.attributes_for(:profile)
        }.to change(Profile,:count).by(1)
      end

      it "redirects to the new contact" do
        post :create, profile: FactoryGirl.attributes_for(:profile)
        response.should redirect_to Profile.last
      end
    end
  end
end
