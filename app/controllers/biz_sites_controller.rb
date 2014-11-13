class BizSitesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_biz_site, only: [:show, :edit, :update, :destroy]

  # GET /biz_sites
  # GET /biz_sites.json
  def index
    @biz_sites = BizSite.order("updated_at DESC").page(params[:page] || 1)
  end

  # GET /biz_sites/1
  # GET /biz_sites/1.json
  def show
  end

  # GET /biz_sites/new
  def new
    @biz_site = BizSite.new
  end

  # GET /biz_sites/1/edit
  def edit
  end

  # POST /biz_sites
  # POST /biz_sites.json
  def create
    @biz_site = BizSite.new(biz_site_params)

    respond_to do |format|
      if @biz_site.save
        format.html { redirect_to biz_sites_path, notice: 'Biz site was successfully created.' }
        format.json { render action: 'show', status: :created, location: @biz_site }
      else
        format.html { render action: 'new' }
        format.json { render json: @biz_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biz_sites/1
  # PATCH/PUT /biz_sites/1.json
  def update
    respond_to do |format|
      if @biz_site.update(biz_site_params)
        format.html { redirect_to biz_sites_path, notice: 'Biz site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @biz_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biz_sites/1
  # DELETE /biz_sites/1.json
  def destroy
    @biz_site.destroy
    respond_to do |format|
      format.html { redirect_to biz_sites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biz_site
      @biz_site = BizSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biz_site_params
      params.require(:biz_site).permit(:title, :thumb, :url, :description)
    end
end
