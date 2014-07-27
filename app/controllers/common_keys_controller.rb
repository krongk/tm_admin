class CommonKeysController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_common_key, only: [:show, :edit, :update, :destroy]

  # GET /common_keys
  # GET /common_keys.json
  def index
    @common_keys = CommonKey.order("name ASC").page(params[:page])
  end

  # GET /common_keys/1
  # GET /common_keys/1.json
  def show
  end

  # GET /common_keys/new
  def new
    @common_key = CommonKey.new
  end

  # GET /common_keys/1/edit
  def edit
  end

  # POST /common_keys
  # POST /common_keys.json
  def create
    @common_key = CommonKey.new(common_key_params)

    respond_to do |format|
      if @common_key.save
        format.html { redirect_to common_keys_path, notice: 'Common key was successfully created.' }
        format.json { render action: 'show', status: :created, location: @common_key }
      else
        format.html { render action: 'new' }
        format.json { render json: @common_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common_keys/1
  # PATCH/PUT /common_keys/1.json
  def update
    respond_to do |format|
      if @common_key.update(common_key_params)
        format.html { redirect_to common_keys_path, notice: 'Common key was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @common_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common_keys/1
  # DELETE /common_keys/1.json
  def destroy
    @common_key.destroy
    respond_to do |format|
      format.html { redirect_to common_keys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_key
      @common_key = CommonKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_key_params
      params.require(:common_key).permit(:name, :typo, :title, :placeholder, :hint, :default_value)
    end
end
