class Payment::CouponsController < ApplicationController
  before_action :set_payment_coupon, only: [:show, :edit, :update, :destroy]

  # GET /payment/coupons
  # GET /payment/coupons.json
  def index
    @payment_coupons = Payment::Coupon.all
  end

  # GET /payment/coupons/1
  # GET /payment/coupons/1.json
  def show
  end

  # GET /payment/coupons/new
  def new
    @payment_coupon = Payment::Coupon.new
  end

  # GET /payment/coupons/1/edit
  def edit
  end

  # POST /payment/coupons
  # POST /payment/coupons.json
  def create
    @payment_coupon = Payment::Coupon.new(payment_coupon_params)

    respond_to do |format|
      if @payment_coupon.save
        format.html { redirect_to payment_coupons_path, notice: 'Coupon was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_coupon }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment/coupons/1
  # PATCH/PUT /payment/coupons/1.json
  def update
    respond_to do |format|
      if @payment_coupon.update(payment_coupon_params)
        format.html { redirect_to payment_coupons_path, notice: 'Coupon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment/coupons/1
  # DELETE /payment/coupons/1.json
  def destroy
    @payment_coupon.destroy
    respond_to do |format|
      format.html { redirect_to payment_coupons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_coupon
      @payment_coupon = Payment::Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_coupon_params
      params.require(:payment_coupon).permit(:code, :start_at, :end_at, :price, :note)
    end
end
