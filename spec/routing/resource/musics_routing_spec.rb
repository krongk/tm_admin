require "spec_helper"

describe Resource::MusicsController do
  describe "routing" do

    it "routes to #index" do
      get("/resource/musics").should route_to("resource/musics#index")
    end

    it "routes to #new" do
      get("/resource/musics/new").should route_to("resource/musics#new")
    end

    it "routes to #show" do
      get("/resource/musics/1").should route_to("resource/musics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resource/musics/1/edit").should route_to("resource/musics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resource/musics").should route_to("resource/musics#create")
    end

    it "routes to #update" do
      put("/resource/musics/1").should route_to("resource/musics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resource/musics/1").should route_to("resource/musics#destroy", :id => "1")
    end

  end
end
