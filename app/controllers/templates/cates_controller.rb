class Templates::CatesController < Templates::ApplicationController
  before_action :set_template_cate, only: [:show, :edit, :update, :destroy]

  # GET /template/cates
  # GET /template/cates.json
  def index
    @template_cates = Templates::Cate.all
  end

  # GET /template/cates/1
  # GET /template/cates/1.json
  def show
  end

  # GET /template/cates/new
  def new
    @template_cate = Templates::Cate.new
  end

  # GET /template/cates/1/edit
  def edit
  end

  # POST /template/cates
  # POST /template/cates.json
  def create
    @template_cate = Templates::Cate.new(template_cate_params)

    respond_to do |format|
      if @template_cate.save
        format.html { redirect_to @template_cate, notice: 'Cate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @template_cate }
      else
        format.html { render action: 'new' }
        format.json { render json: @template_cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template/cates/1
  # PATCH/PUT /template/cates/1.json
  def update
    respond_to do |format|
      if @template_cate.update(template_cate_params)
        format.html { redirect_to @template_cate, notice: 'Cate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @template_cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template/cates/1
  # DELETE /template/cates/1.json
  def destroy
    @template_cate.destroy
    respond_to do |format|
      format.html { redirect_to template_cates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_cate
      @template_cate = Templates::Cate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_cate_params
      params.require(:templates_cate).permit(:title, :description)
    end
end
