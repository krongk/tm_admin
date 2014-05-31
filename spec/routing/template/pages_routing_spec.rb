require "spec_helper"

describe Template::PagesController do
  describe "routing" do

    it "routes to #index" do
      get("/template/pages").should route_to("template/pages#index")
    end

    it "routes to #new" do
      get("/template/pages/new").should route_to("template/pages#new")
    end

    it "routes to #show" do
      get("/template/pages/1").should route_to("template/pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/template/pages/1/edit").should route_to("template/pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/template/pages").should route_to("template/pages#create")
    end

    it "routes to #update" do
      put("/template/pages/1").should route_to("template/pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/template/pages/1").should route_to("template/pages#destroy", :id => "1")
    end

  end
end
