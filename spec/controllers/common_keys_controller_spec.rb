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

describe CommonKeysController do

  # This should return the minimal set of attributes required to create a valid
  # CommonKey. As you add validations to CommonKey, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommonKeysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all common_keys as @common_keys" do
      common_key = CommonKey.create! valid_attributes
      get :index, {}, valid_session
      assigns(:common_keys).should eq([common_key])
    end
  end

  describe "GET show" do
    it "assigns the requested common_key as @common_key" do
      common_key = CommonKey.create! valid_attributes
      get :show, {:id => common_key.to_param}, valid_session
      assigns(:common_key).should eq(common_key)
    end
  end

  describe "GET new" do
    it "assigns a new common_key as @common_key" do
      get :new, {}, valid_session
      assigns(:common_key).should be_a_new(CommonKey)
    end
  end

  describe "GET edit" do
    it "assigns the requested common_key as @common_key" do
      common_key = CommonKey.create! valid_attributes
      get :edit, {:id => common_key.to_param}, valid_session
      assigns(:common_key).should eq(common_key)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CommonKey" do
        expect {
          post :create, {:common_key => valid_attributes}, valid_session
        }.to change(CommonKey, :count).by(1)
      end

      it "assigns a newly created common_key as @common_key" do
        post :create, {:common_key => valid_attributes}, valid_session
        assigns(:common_key).should be_a(CommonKey)
        assigns(:common_key).should be_persisted
      end

      it "redirects to the created common_key" do
        post :create, {:common_key => valid_attributes}, valid_session
        response.should redirect_to(CommonKey.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved common_key as @common_key" do
        # Trigger the behavior that occurs when invalid params are submitted
        CommonKey.any_instance.stub(:save).and_return(false)
        post :create, {:common_key => { "name" => "invalid value" }}, valid_session
        assigns(:common_key).should be_a_new(CommonKey)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CommonKey.any_instance.stub(:save).and_return(false)
        post :create, {:common_key => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested common_key" do
        common_key = CommonKey.create! valid_attributes
        # Assuming there are no other common_keys in the database, this
        # specifies that the CommonKey created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CommonKey.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => common_key.to_param, :common_key => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested common_key as @common_key" do
        common_key = CommonKey.create! valid_attributes
        put :update, {:id => common_key.to_param, :common_key => valid_attributes}, valid_session
        assigns(:common_key).should eq(common_key)
      end

      it "redirects to the common_key" do
        common_key = CommonKey.create! valid_attributes
        put :update, {:id => common_key.to_param, :common_key => valid_attributes}, valid_session
        response.should redirect_to(common_key)
      end
    end

    describe "with invalid params" do
      it "assigns the common_key as @common_key" do
        common_key = CommonKey.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CommonKey.any_instance.stub(:save).and_return(false)
        put :update, {:id => common_key.to_param, :common_key => { "name" => "invalid value" }}, valid_session
        assigns(:common_key).should eq(common_key)
      end

      it "re-renders the 'edit' template" do
        common_key = CommonKey.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CommonKey.any_instance.stub(:save).and_return(false)
        put :update, {:id => common_key.to_param, :common_key => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested common_key" do
      common_key = CommonKey.create! valid_attributes
      expect {
        delete :destroy, {:id => common_key.to_param}, valid_session
      }.to change(CommonKey, :count).by(-1)
    end

    it "redirects to the common_keys list" do
      common_key = CommonKey.create! valid_attributes
      delete :destroy, {:id => common_key.to_param}, valid_session
      response.should redirect_to(common_keys_url)
    end
  end

end
