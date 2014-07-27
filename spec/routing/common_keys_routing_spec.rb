require "spec_helper"

describe CommonKeysController do
  describe "routing" do

    it "routes to #index" do
      get("/common_keys").should route_to("common_keys#index")
    end

    it "routes to #new" do
      get("/common_keys/new").should route_to("common_keys#new")
    end

    it "routes to #show" do
      get("/common_keys/1").should route_to("common_keys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/common_keys/1/edit").should route_to("common_keys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/common_keys").should route_to("common_keys#create")
    end

    it "routes to #update" do
      put("/common_keys/1").should route_to("common_keys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/common_keys/1").should route_to("common_keys#destroy", :id => "1")
    end

  end
end
