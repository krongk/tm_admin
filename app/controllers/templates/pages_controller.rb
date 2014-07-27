class Templates::PagesController < Templates::ApplicationController
  before_action :set_template_page, only: [:show, :edit, :update, :destroy]
  before_action :set_template, only: [:new, :show, :index, :edit, :update]
  

  # GET /template/pages
  # GET /template/pages.json
  def index
    @template_pages = Templates::Page.all
  end

  # GET /template/pages/1
  # GET /template/pages/1.json
  def show
  end

  # GET /template/pages/new
  def new
    @template_page = Templates::Page.new
  end

  # GET /template/pages/1/edit
  def edit
  end

  # POST /template/pages
  # POST /template/pages.json
  def create
    @template = Templates::Template.find(templates_page_params[:template_id])
    @template_page = Templates::Page.new(templates_page_params)

    respond_to do |format|
      if @template_page.save
        format.html { redirect_to @template, notice: t('flash.template.pages.create.notice') }
        format.json { render action: 'show', status: :created, location: @template_page }
      else
        format.html { render action: 'new' }
        format.json { render json: @template_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template/pages/1
  # PATCH/PUT /template/pages/1.json
  def update
    @template = Templates::Template.find(templates_page_params[:template_id])
    respond_to do |format|
      if @template_page.update(templates_page_params)
        format.html { redirect_to @template, notice:  t('flash.template.pages.update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @template_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template/pages/1
  # DELETE /template/pages/1.json
  def destroy
    @template_page.destroy
    respond_to do |format|
      format.html { redirect_to templates_template_path(@template_page.template) }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_template_page
      @template_page = Templates::Page.find(params[:id])
    end

    # filter set_template_page first, then filter set_template
    def set_template
      @template =  @template_page.try(:template)
      @template ||= Templates::Template.find(params[:template_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def templates_page_params
      params.require(:templates_page).permit(:template_id, :position, :html, :form, :title, :image_count, :demo_img)
    end
end
