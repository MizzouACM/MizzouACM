require 'spec_helper'

describe UsersController do

  before do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => @user
      response.should be_success
    end
  end

  describe "GET edit" do
    it "returns http success if admin" do
      session[:user_id] = @admin.id
      get 'edit', :id => @user
      response.should be_success
    end

    it 'redirects if not admin' do
      session[:user_id] = @user.id
      get 'edit', :id => @user
      response.should be_redirect
    end
  end

  describe "PUT update" do
    it "redirects if not admin" do
      session[:user_id] = @user.id
      put 'update', :id => @user, :user => {:name => "ted"}
      response.should be_redirect
    end

    it 'redirects to user if admin' do
      session[:user_id] = @admin.id
      put 'update', :id => @user, :user => {:name => "ted"}
      response.should redirect_to(user_path(@user))
    end
  end

end
