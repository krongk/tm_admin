class Templates::HomesController < ApplicationController
  before_action :set_templates_home, only: [:show, :edit, :update, :destroy]

  # GET /templates/homes
  # GET /templates/homes.json
  def index
    @templates_homes = Templates::Home.all
  end

  # GET /templates/homes/1
  # GET /templates/homes/1.json
  def show
  end

  # GET /templates/homes/new
  def new
    @templates_home = Templates::Home.new
  end

  # GET /templates/homes/1/edit
  def edit
  end

  # POST /templates/homes
  # POST /templates/homes.json
  def create
    @templates_home = Templates::Home.new(templates_home_params)

    respond_to do |format|
      if @templates_home.save
        format.html { redirect_to @templates_home, notice: 'Home was successfully created.' }
        format.json { render action: 'show', status: :created, location: @templates_home }
      else
        format.html { render action: 'new' }
        format.json { render json: @templates_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/homes/1
  # PATCH/PUT /templates/homes/1.json
  def update
    respond_to do |format|
      if @templates_home.update(templates_home_params)
        format.html { redirect_to @templates_home, notice: 'Home was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @templates_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/homes/1
  # DELETE /templates/homes/1.json
  def destroy
    @templates_home.destroy
    respond_to do |format|
      format.html { redirect_to templates_homes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_templates_home
      @templates_home = Templates::Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def templates_home_params
      params.require(:templates_home).permit(:help)
    end
end
