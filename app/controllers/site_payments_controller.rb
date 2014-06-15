class SitePaymentsController < ApplicationController
  before_action :set_site_payment, only: [:show, :edit, :update, :destroy]

  # GET /site_payments
  # GET /site_payments.json
   def index
    conditions = []
    queries = []
    
    if params[:status]
      queries << "status = ?" 
      conditions << params[:status]
    end
    if params[:site_id]
      queries << "site_id = ?" 
      conditions << params[:site_id]
    end
    conditions.unshift(queries.join(' AND '))

    @site_payments = SitePayment.where(conditions).order("created_at DESC").page(params[:page])
  end

  # GET /site_payments/1
  # GET /site_payments/1.json
  def show
  end

  # GET /site_payments/new
  def new
    @site_payment = SitePayment.new
  end

  # GET /site_payments/1/edit
  def edit
  end

  # POST /site_payments
  # POST /site_payments.json
  def create
    @site_payment = SitePayment.new(site_payment_params)

    respond_to do |format|
      if @site_payment.save
        format.html { redirect_to @site_payment, notice: 'Site payment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site_payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_payments/1
  # PATCH/PUT /site_payments/1.json
  def update
    respond_to do |format|
      if @site_payment.update(site_payment_params)
        format.html { redirect_to @site_payment, notice: 'Site payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_payments/1
  # DELETE /site_payments/1.json
  def destroy
    @site_payment.destroy
    respond_to do |format|
      format.html { redirect_to site_payments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_payment
      @site_payment = SitePayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_payment_params
      params.require(:site_payment).permit(:site_id, :status, :pay_type, :price, :pay_at, :updated_by, :note, :is_processed)
    end
end
