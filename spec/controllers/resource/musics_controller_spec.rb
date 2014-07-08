require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Resource::MusicsController do

  # This should return the minimal set of attributes required to create a valid
  # Resource::Music. As you add validations to Resource::Music, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Resource::MusicsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all resource_musics as @resource_musics" do
      music = Resource::Music.create! valid_attributes
      get :index, {}, valid_session
      assigns(:resource_musics).should eq([music])
    end
  end

  describe "GET show" do
    it "assigns the requested resource_music as @resource_music" do
      music = Resource::Music.create! valid_attributes
      get :show, {:id => music.to_param}, valid_session
      assigns(:resource_music).should eq(music)
    end
  end

  describe "GET new" do
    it "assigns a new resource_music as @resource_music" do
      get :new, {}, valid_session
      assigns(:resource_music).should be_a_new(Resource::Music)
    end
  end

  describe "GET edit" do
    it "assigns the requested resource_music as @resource_music" do
      music = Resource::Music.create! valid_attributes
      get :edit, {:id => music.to_param}, valid_session
      assigns(:resource_music).should eq(music)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Resource::Music" do
        expect {
          post :create, {:resource_music => valid_attributes}, valid_session
        }.to change(Resource::Music, :count).by(1)
      end

      it "assigns a newly created resource_music as @resource_music" do
        post :create, {:resource_music => valid_attributes}, valid_session
        assigns(:resource_music).should be_a(Resource::Music)
        assigns(:resource_music).should be_persisted
      end

      it "redirects to the created resource_music" do
        post :create, {:resource_music => valid_attributes}, valid_session
        response.should redirect_to(Resource::Music.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved resource_music as @resource_music" do
        # Trigger the behavior that occurs when invalid params are submitted
        Resource::Music.any_instance.stub(:save).and_return(false)
        post :create, {:resource_music => { "name" => "invalid value" }}, valid_session
        assigns(:resource_music).should be_a_new(Resource::Music)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Resource::Music.any_instance.stub(:save).and_return(false)
        post :create, {:resource_music => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested resource_music" do
        music = Resource::Music.create! valid_attributes
        # Assuming there are no other resource_musics in the database, this
        # specifies that the Resource::Music created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Resource::Music.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => music.to_param, :resource_music => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested resource_music as @resource_music" do
        music = Resource::Music.create! valid_attributes
        put :update, {:id => music.to_param, :resource_music => valid_attributes}, valid_session
        assigns(:resource_music).should eq(music)
      end

      it "redirects to the resource_music" do
        music = Resource::Music.create! valid_attributes
        put :update, {:id => music.to_param, :resource_music => valid_attributes}, valid_session
        response.should redirect_to(music)
      end
    end

    describe "with invalid params" do
      it "assigns the resource_music as @resource_music" do
        music = Resource::Music.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Resource::Music.any_instance.stub(:save).and_return(false)
        put :update, {:id => music.to_param, :resource_music => { "name" => "invalid value" }}, valid_session
        assigns(:resource_music).should eq(music)
      end

      it "re-renders the 'edit' template" do
        music = Resource::Music.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Resource::Music.any_instance.stub(:save).and_return(false)
        put :update, {:id => music.to_param, :resource_music => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested resource_music" do
      music = Resource::Music.create! valid_attributes
      expect {
        delete :destroy, {:id => music.to_param}, valid_session
      }.to change(Resource::Music, :count).by(-1)
    end

    it "redirects to the resource_musics list" do
      music = Resource::Music.create! valid_attributes
      delete :destroy, {:id => music.to_param}, valid_session
      response.should redirect_to(resource_musics_url)
    end
  end

end
