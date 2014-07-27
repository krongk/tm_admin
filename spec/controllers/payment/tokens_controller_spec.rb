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

describe Payment::TokensController do

  # This should return the minimal set of attributes required to create a valid
  # Payment::Token. As you add validations to Payment::Token, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "code" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Payment::TokensController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all payment_tokens as @payment_tokens" do
      token = Payment::Token.create! valid_attributes
      get :index, {}, valid_session
      assigns(:payment_tokens).should eq([token])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_token as @payment_token" do
      token = Payment::Token.create! valid_attributes
      get :show, {:id => token.to_param}, valid_session
      assigns(:payment_token).should eq(token)
    end
  end

  describe "GET new" do
    it "assigns a new payment_token as @payment_token" do
      get :new, {}, valid_session
      assigns(:payment_token).should be_a_new(Payment::Token)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_token as @payment_token" do
      token = Payment::Token.create! valid_attributes
      get :edit, {:id => token.to_param}, valid_session
      assigns(:payment_token).should eq(token)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Payment::Token" do
        expect {
          post :create, {:payment_token => valid_attributes}, valid_session
        }.to change(Payment::Token, :count).by(1)
      end

      it "assigns a newly created payment_token as @payment_token" do
        post :create, {:payment_token => valid_attributes}, valid_session
        assigns(:payment_token).should be_a(Payment::Token)
        assigns(:payment_token).should be_persisted
      end

      it "redirects to the created payment_token" do
        post :create, {:payment_token => valid_attributes}, valid_session
        response.should redirect_to(Payment::Token.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_token as @payment_token" do
        # Trigger the behavior that occurs when invalid params are submitted
        Payment::Token.any_instance.stub(:save).and_return(false)
        post :create, {:payment_token => { "code" => "invalid value" }}, valid_session
        assigns(:payment_token).should be_a_new(Payment::Token)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Payment::Token.any_instance.stub(:save).and_return(false)
        post :create, {:payment_token => { "code" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested payment_token" do
        token = Payment::Token.create! valid_attributes
        # Assuming there are no other payment_tokens in the database, this
        # specifies that the Payment::Token created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Payment::Token.any_instance.should_receive(:update).with({ "code" => "MyString" })
        put :update, {:id => token.to_param, :payment_token => { "code" => "MyString" }}, valid_session
      end

      it "assigns the requested payment_token as @payment_token" do
        token = Payment::Token.create! valid_attributes
        put :update, {:id => token.to_param, :payment_token => valid_attributes}, valid_session
        assigns(:payment_token).should eq(token)
      end

      it "redirects to the payment_token" do
        token = Payment::Token.create! valid_attributes
        put :update, {:id => token.to_param, :payment_token => valid_attributes}, valid_session
        response.should redirect_to(token)
      end
    end

    describe "with invalid params" do
      it "assigns the payment_token as @payment_token" do
        token = Payment::Token.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Payment::Token.any_instance.stub(:save).and_return(false)
        put :update, {:id => token.to_param, :payment_token => { "code" => "invalid value" }}, valid_session
        assigns(:payment_token).should eq(token)
      end

      it "re-renders the 'edit' template" do
        token = Payment::Token.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Payment::Token.any_instance.stub(:save).and_return(false)
        put :update, {:id => token.to_param, :payment_token => { "code" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested payment_token" do
      token = Payment::Token.create! valid_attributes
      expect {
        delete :destroy, {:id => token.to_param}, valid_session
      }.to change(Payment::Token, :count).by(-1)
    end

    it "redirects to the payment_tokens list" do
      token = Payment::Token.create! valid_attributes
      delete :destroy, {:id => token.to_param}, valid_session
      response.should redirect_to(payment_tokens_url)
    end
  end

end
