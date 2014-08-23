class SitePageKeystoresController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_site_page_keystore, only: [:show, :edit, :update, :destroy]

  # GET /site_page_keystores
  # GET /site_page_keystores.json
  def index
    @site_page_keystores = SitePageKeystore.order("updated_at desc").page(params[:page])
  end

  # GET /site_page_keystores/1
  # GET /site_page_keystores/1.json
  def show
  end

  # GET /site_page_keystores/new
  def new
    @site_page_keystore = SitePageKeystore.new
  end

  # GET /site_page_keystores/1/edit
  def edit
  end

  # POST /site_page_keystores
  # POST /site_page_keystores.json
  def create
    @site_page_keystore = SitePageKeystore.new(site_page_keystore_params)

    respond_to do |format|
      if @site_page_keystore.save
        format.html { redirect_to site_page_keystores_path, notice: 'Site page keystore was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site_page_keystore }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_page_keystore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_page_keystores/1
  # PATCH/PUT /site_page_keystores/1.json
  def update
    respond_to do |format|
      if @site_page_keystore.update(site_page_keystore_params)
        format.html { redirect_to site_page_keystores_path, notice: 'Site page keystore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_page_keystore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_page_keystores/1
  # DELETE /site_page_keystores/1.json
  def destroy
    @site_page_keystore.destroy
    respond_to do |format|
      format.html { redirect_to site_page_keystores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_page_keystore
      @site_page_keystore = SitePageKeystore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_page_keystore_params
      params.require(:site_page_keystore).permit(:value)
    end
end
