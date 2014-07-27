require "spec_helper"

describe Template::ThemesController do
  describe "routing" do

    it "routes to #index" do
      get("/template/themes").should route_to("template/themes#index")
    end

    it "routes to #new" do
      get("/template/themes/new").should route_to("template/themes#new")
    end

    it "routes to #show" do
      get("/template/themes/1").should route_to("template/themes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/template/themes/1/edit").should route_to("template/themes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/template/themes").should route_to("template/themes#create")
    end

    it "routes to #update" do
      put("/template/themes/1").should route_to("template/themes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/template/themes/1").should route_to("template/themes#destroy", :id => "1")
    end

  end
end
