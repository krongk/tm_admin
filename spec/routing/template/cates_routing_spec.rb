require "spec_helper"

describe Template::CatesController do
  describe "routing" do

    it "routes to #index" do
      get("/template/cates").should route_to("template/cates#index")
    end

    it "routes to #new" do
      get("/template/cates/new").should route_to("template/cates#new")
    end

    it "routes to #show" do
      get("/template/cates/1").should route_to("template/cates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/template/cates/1/edit").should route_to("template/cates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/template/cates").should route_to("template/cates#create")
    end

    it "routes to #update" do
      put("/template/cates/1").should route_to("template/cates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/template/cates/1").should route_to("template/cates#destroy", :id => "1")
    end

  end
end
