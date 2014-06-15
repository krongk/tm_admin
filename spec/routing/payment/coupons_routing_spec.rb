require "spec_helper"

describe Payment::CouponsController do
  describe "routing" do

    it "routes to #index" do
      get("/payment/coupons").should route_to("payment/coupons#index")
    end

    it "routes to #new" do
      get("/payment/coupons/new").should route_to("payment/coupons#new")
    end

    it "routes to #show" do
      get("/payment/coupons/1").should route_to("payment/coupons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payment/coupons/1/edit").should route_to("payment/coupons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payment/coupons").should route_to("payment/coupons#create")
    end

    it "routes to #update" do
      put("/payment/coupons/1").should route_to("payment/coupons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payment/coupons/1").should route_to("payment/coupons#destroy", :id => "1")
    end

  end
end
