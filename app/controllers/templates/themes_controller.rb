class Templates::ThemesController < Templates::ApplicationController
  before_action :set_template_theme, only: [:show, :edit, :update, :destroy]
  before_action :set_template, only: [:new, :show, :index, :edit, :update]
  

  # GET /template/themes
  # GET /template/themes.json
  def index
    @template_themes = @template.themes.all
  end

  # GET /template/themes/1
  # GET /template/themes/1.json
  def show
  end

  # GET /template/themes/new
  def new
    @template_theme = Templates::Theme.new
  end

  # GET /template/themes/1/edit
  def edit
  end

  # POST /template/themes
  # POST /template/themes.json
  def create
    @template = Templates::Template.find(templates_theme_params[:template_id])
    @template_theme = Templates::Theme.new(templates_theme_params)

    respond_to do |format|
      if @template_theme.save
        format.html { redirect_to @template, notice: 'Theme was successfully created.' }
        format.json { render action: 'show', status: :created, location: @template_theme }
      else
        format.html { render action: 'new' }
        format.json { render json: @template_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template/themes/1
  # PATCH/PUT /template/themes/1.json
  def update
    @template = Templates::Template.find(templates_theme_params[:template_id])
    respond_to do |format|
      if @template_theme.update(templates_theme_params)
        format.html { redirect_to @template, notice: 'Theme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @template_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template/themes/1
  # DELETE /template/themes/1.json
  def destroy
    @template = @template_theme.template
    @template_theme.destroy
    respond_to do |format|
      format.html { redirect_to templates_template_path(@template) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_theme
      @template_theme = Templates::Theme.find(params[:id])
    end

    # filter set_template_page first, then filter set_template
    def set_template
      @template =  @template_theme.try(:template)
      @template ||= Templates::Template.find_by(id: params[:template_id])
      redirect_to templates_templates_path if @template.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def templates_theme_params
      params.require(:templates_theme).permit(:template_id, :title, :css_url, :preview_images, :preview_url)
    end
end
