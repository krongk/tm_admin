require "spec_helper"

describe Payment::TokensController do
  describe "routing" do

    it "routes to #index" do
      get("/payment/tokens").should route_to("payment/tokens#index")
    end

    it "routes to #new" do
      get("/payment/tokens/new").should route_to("payment/tokens#new")
    end

    it "routes to #show" do
      get("/payment/tokens/1").should route_to("payment/tokens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payment/tokens/1/edit").should route_to("payment/tokens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payment/tokens").should route_to("payment/tokens#create")
    end

    it "routes to #update" do
      put("/payment/tokens/1").should route_to("payment/tokens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payment/tokens/1").should route_to("payment/tokens#destroy", :id => "1")
    end

  end
end
