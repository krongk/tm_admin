require "spec_helper"

describe SitePageKeystoresController do
  describe "routing" do

    it "routes to #index" do
      get("/site_page_keystores").should route_to("site_page_keystores#index")
    end

    it "routes to #new" do
      get("/site_page_keystores/new").should route_to("site_page_keystores#new")
    end

    it "routes to #show" do
      get("/site_page_keystores/1").should route_to("site_page_keystores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_page_keystores/1/edit").should route_to("site_page_keystores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_page_keystores").should route_to("site_page_keystores#create")
    end

    it "routes to #update" do
      put("/site_page_keystores/1").should route_to("site_page_keystores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_page_keystores/1").should route_to("site_page_keystores#destroy", :id => "1")
    end

  end
end
