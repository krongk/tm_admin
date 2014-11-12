class SitesController < ApplicationController
  include SitePaymentsHelper
  before_filter :authenticate_user!
  before_action :set_site, only: [:show, :edit, :update, :destroy]


  #skip CSRF on create.
  skip_before_filter :verify_authenticity_token, :only => [:temp_form_update]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.order("updated_at DESC").page( params[:page])
  end

  def payed
    @sites = Site.payed.page( params[:page])
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    @template = Template::Template.find(params[:temp_id])
    redirect_to template_templates_path if @template.nil? and return

    @site = Site.new
  end

  #
  def temp_form_update
    #render text: params
    params.delete(:controller)
    params.delete(:action)
    params.delete(:submit)
    #
    site_page = SitePage.find(params.delete(:site_page_id))
    redirect_to '/' if site_page.nil? and return

    params.each_pair do |key, val|
      SitePageKeystore.put(site_page.id, key, val)
    end
    #next page
    @site = site_page.site
    next_site_page = SitePage.where("site_id = ? AND id > ?", @site.id, site_page.id).order("id ASC").first
    if next_site_page.nil?
      redirect_to site_path(@site), notice: t('temp_form.update.finished') and return
    else
      redirect_to edit_site_page_url(), notice: t('temp_form.update.next') and return
    end
  end

  # GET /sites/1/edit
  def edit
    @template = Templates::Template.find(@site.template_id)
  end

  # POST /sites
  # POST /sites.json
  def create
    #render text: site_params.merge(user_id: current_user.id) and return

    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        #build site_page via template_page
        Template::Page.where(template_id: @site.template_id).order("sort_id ASC").each do |temp_page|
          @site.site_pages.create(user_id: current_user.id, 
            site_id: @site.id, 
            template_page_id: temp_page.id,
            short_title: get_short_title(@site),
            title: temp_page.title)
        end
        format.html { redirect_to edit_site_page_url(@site.site_pages.first), notice: 'Site was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to sites_path, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  private
    def get_short_title(site)
      site.title + rand(2000).to_s + '-' + Time.now.to_i.to_s
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:user_id, :template_id, :short_title, :title, :description, :domain, :status, :is_published)
    end
end
