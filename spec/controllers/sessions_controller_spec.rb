require 'spec_helper'

describe SessionsController do

  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = {
        'uid' => '12345',
        'provider' => 'github',
        'info' => {
          'name' => 'Bob',
          'email' => 'tester@testing.com'
        }
      }
  end

  describe "GET 'new'" do
    it "redirects users to authentication" do
      get 'new'
      assert_redirected_to '/auth/developer'
    end
  end

  describe "creates new user" do
    it "redirects users with email back to root_url" do
      @user = FactoryGirl.create(:user, :email => "Tester@testing.com")
      visit '/signin'
      page.should have_content('Signed in!')
      current_path.should == '/'
    end
  end

end
