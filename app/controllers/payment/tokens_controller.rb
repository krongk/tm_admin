class Payment::TokensController < ApplicationController
  before_action :set_payment_token, only: [:show, :edit, :update, :destroy]

  # GET /payment/tokens
  # GET /payment/tokens.json
  def index
    conditions = []
    queries = []
    
    if params[:status]
      queries << "status = ?" 
      conditions << params[:status]
    end
    if params[:user_id]
      queries << "user_id = ?" 
      conditions << params[:user_id]
    end
    conditions.unshift(queries.join(' AND '))

    @payment_tokens = Payment::Token.where(conditions).order("created_at DESC").page(params[:page])

    @users = User.all.select{|u| u.has_role?(ENV["ROLES"]['VIP'])}
  end

  # GET /payment/tokens/1
  # GET /payment/tokens/1.json
  def show
  end

  # GET /payment/tokens/new
  def new
    @payment_token = Payment::Token.new
  end

  # GET /payment/tokens/1/edit
  def edit
  end

  # POST /payment/tokens
  # POST /payment/tokens.json
  #"payment_token"=>{"count"=>"3", "user_id"=>"2", "status"=>"active", "note"=>"ccc"}
  def create
    (payment_token_params.delete(:count).to_i || 1).times do 
      @payment_token = Payment::Token.new(payment_token_params)
      @payment_token.created_by = current_user.id
      @payment_token.save
    end

    respond_to do |format|
      if @payment_token.present?
        format.html { redirect_to payment_tokens_path, notice: 'Token was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_token }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment/tokens/1
  # PATCH/PUT /payment/tokens/1.json
  def update
    respond_to do |format|
      if @payment_token.update(payment_token_params)
        format.html { redirect_to payment_tokens_path, notice: 'Token was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment/tokens/1
  # DELETE /payment/tokens/1.json
  def destroy
    @payment_token.destroy
    respond_to do |format|
      format.html { redirect_to payment_tokens_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_token
      @payment_token = Payment::Token.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_token_params
      params.require(:payment_token).permit(:code, :count, :user_id, :created_by, :status, :note)
    end
end
