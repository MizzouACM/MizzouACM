require "spec_helper"

describe HacksController do
  describe "routing" do

    it "routes to #index" do
      get("/hacks").should route_to("hacks#index")
    end

    it "routes to #new" do
      get("/hacks/new").should route_to("hacks#new")
    end

    it "routes to #show" do
      get("/hacks/1").should route_to("hacks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hacks/1/edit").should route_to("hacks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hacks").should route_to("hacks#create")
    end

    it "routes to #update" do
      put("/hacks/1").should route_to("hacks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hacks/1").should route_to("hacks#destroy", :id => "1")
    end

  end
end
