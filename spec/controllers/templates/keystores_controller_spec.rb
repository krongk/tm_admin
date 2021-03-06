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

describe Templates::KeystoresController do

  # This should return the minimal set of attributes required to create a valid
  # Templates::Keystore. As you add validations to Templates::Keystore, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "source_type" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Templates::KeystoresController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all templates_keystores as @templates_keystores" do
      keystore = Templates::Keystore.create! valid_attributes
      get :index, {}, valid_session
      assigns(:templates_keystores).should eq([keystore])
    end
  end

  describe "GET show" do
    it "assigns the requested templates_keystore as @templates_keystore" do
      keystore = Templates::Keystore.create! valid_attributes
      get :show, {:id => keystore.to_param}, valid_session
      assigns(:templates_keystore).should eq(keystore)
    end
  end

  describe "GET new" do
    it "assigns a new templates_keystore as @templates_keystore" do
      get :new, {}, valid_session
      assigns(:templates_keystore).should be_a_new(Templates::Keystore)
    end
  end

  describe "GET edit" do
    it "assigns the requested templates_keystore as @templates_keystore" do
      keystore = Templates::Keystore.create! valid_attributes
      get :edit, {:id => keystore.to_param}, valid_session
      assigns(:templates_keystore).should eq(keystore)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Templates::Keystore" do
        expect {
          post :create, {:templates_keystore => valid_attributes}, valid_session
        }.to change(Templates::Keystore, :count).by(1)
      end

      it "assigns a newly created templates_keystore as @templates_keystore" do
        post :create, {:templates_keystore => valid_attributes}, valid_session
        assigns(:templates_keystore).should be_a(Templates::Keystore)
        assigns(:templates_keystore).should be_persisted
      end

      it "redirects to the created templates_keystore" do
        post :create, {:templates_keystore => valid_attributes}, valid_session
        response.should redirect_to(Templates::Keystore.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved templates_keystore as @templates_keystore" do
        # Trigger the behavior that occurs when invalid params are submitted
        Templates::Keystore.any_instance.stub(:save).and_return(false)
        post :create, {:templates_keystore => { "source_type" => "invalid value" }}, valid_session
        assigns(:templates_keystore).should be_a_new(Templates::Keystore)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Templates::Keystore.any_instance.stub(:save).and_return(false)
        post :create, {:templates_keystore => { "source_type" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested templates_keystore" do
        keystore = Templates::Keystore.create! valid_attributes
        # Assuming there are no other templates_keystores in the database, this
        # specifies that the Templates::Keystore created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Templates::Keystore.any_instance.should_receive(:update).with({ "source_type" => "MyString" })
        put :update, {:id => keystore.to_param, :templates_keystore => { "source_type" => "MyString" }}, valid_session
      end

      it "assigns the requested templates_keystore as @templates_keystore" do
        keystore = Templates::Keystore.create! valid_attributes
        put :update, {:id => keystore.to_param, :templates_keystore => valid_attributes}, valid_session
        assigns(:templates_keystore).should eq(keystore)
      end

      it "redirects to the templates_keystore" do
        keystore = Templates::Keystore.create! valid_attributes
        put :update, {:id => keystore.to_param, :templates_keystore => valid_attributes}, valid_session
        response.should redirect_to(keystore)
      end
    end

    describe "with invalid params" do
      it "assigns the templates_keystore as @templates_keystore" do
        keystore = Templates::Keystore.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Templates::Keystore.any_instance.stub(:save).and_return(false)
        put :update, {:id => keystore.to_param, :templates_keystore => { "source_type" => "invalid value" }}, valid_session
        assigns(:templates_keystore).should eq(keystore)
      end

      it "re-renders the 'edit' template" do
        keystore = Templates::Keystore.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Templates::Keystore.any_instance.stub(:save).and_return(false)
        put :update, {:id => keystore.to_param, :templates_keystore => { "source_type" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested templates_keystore" do
      keystore = Templates::Keystore.create! valid_attributes
      expect {
        delete :destroy, {:id => keystore.to_param}, valid_session
      }.to change(Templates::Keystore, :count).by(-1)
    end

    it "redirects to the templates_keystores list" do
      keystore = Templates::Keystore.create! valid_attributes
      delete :destroy, {:id => keystore.to_param}, valid_session
      response.should redirect_to(templates_keystores_url)
    end
  end

end
