class Templates::TemplatesController < Templates::ApplicationController
  before_action :set_template_template, only: [:show, :edit, :update, :destroy]

  # GET /template/templates
  # GET /template/templates.json
  def index
    @templates = Templates::Template.all
  end

  # GET /template/templates/1
  # GET /template/templates/1.json
  def show
    @template_keystores = Templates::Keystore.where(source_type: 'Templates::Template', source_id: @template.id)
  end

  # GET /template/templates/new
  def new
    @template = Templates::Template.new
  end

  # GET /template/templates/1/edit
  def edit
  end

  # POST /template/templates
  # POST /template/templates.json
  def create
    #render text: templates_template_params and return

    @template = Templates::Template.new(templates_template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to templates_template_path(@template), notice: t('flash.template.create.notice') }
        format.json { render action: 'show', status: :created, location: @template }
      else
        format.html { render action: 'new' }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template/templates/1
  # PATCH/PUT /template/templates/1.json
  def update
    respond_to do |format|
      if @template.update(templates_template_params)
        update_tag(@template)
        format.html { redirect_to  templates_template_path(@template), notice: t('flash.template.update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template/templates/1
  # DELETE /template/templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_templates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_template
      @template = Templates::Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def templates_template_params
      params.require(:templates_template).permit(:cate_id, :property, :base_url, :title, :keywords, :summary, :description, :demo_img, :demo_url)
    end
end
