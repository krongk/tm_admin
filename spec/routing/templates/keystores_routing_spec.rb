require "spec_helper"

describe Templates::KeystoresController do
  describe "routing" do

    it "routes to #index" do
      get("/templates/keystores").should route_to("templates/keystores#index")
    end

    it "routes to #new" do
      get("/templates/keystores/new").should route_to("templates/keystores#new")
    end

    it "routes to #show" do
      get("/templates/keystores/1").should route_to("templates/keystores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/templates/keystores/1/edit").should route_to("templates/keystores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/templates/keystores").should route_to("templates/keystores#create")
    end

    it "routes to #update" do
      put("/templates/keystores/1").should route_to("templates/keystores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/templates/keystores/1").should route_to("templates/keystores#destroy", :id => "1")
    end

  end
end
