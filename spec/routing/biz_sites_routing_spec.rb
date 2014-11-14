require "spec_helper"

describe BizSitesController do
  describe "routing" do

    it "routes to #index" do
      get("/biz_sites").should route_to("biz_sites#index")
    end

    it "routes to #new" do
      get("/biz_sites/new").should route_to("biz_sites#new")
    end

    it "routes to #show" do
      get("/biz_sites/1").should route_to("biz_sites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/biz_sites/1/edit").should route_to("biz_sites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/biz_sites").should route_to("biz_sites#create")
    end

    it "routes to #update" do
      put("/biz_sites/1").should route_to("biz_sites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/biz_sites/1").should route_to("biz_sites#destroy", :id => "1")
    end

  end
end
