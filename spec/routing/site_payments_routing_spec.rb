require "spec_helper"

describe SitePaymentsController do
  describe "routing" do

    it "routes to #index" do
      get("/site_payments").should route_to("site_payments#index")
    end

    it "routes to #new" do
      get("/site_payments/new").should route_to("site_payments#new")
    end

    it "routes to #show" do
      get("/site_payments/1").should route_to("site_payments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_payments/1/edit").should route_to("site_payments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_payments").should route_to("site_payments#create")
    end

    it "routes to #update" do
      put("/site_payments/1").should route_to("site_payments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_payments/1").should route_to("site_payments#destroy", :id => "1")
    end

  end
end
