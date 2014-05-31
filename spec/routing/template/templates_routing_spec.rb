require "spec_helper"

describe Template::TemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/template/templates").should route_to("template/templates#index")
    end

    it "routes to #new" do
      get("/template/templates/new").should route_to("template/templates#new")
    end

    it "routes to #show" do
      get("/template/templates/1").should route_to("template/templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/template/templates/1/edit").should route_to("template/templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/template/templates").should route_to("template/templates#create")
    end

    it "routes to #update" do
      put("/template/templates/1").should route_to("template/templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/template/templates/1").should route_to("template/templates#destroy", :id => "1")
    end

  end
end
