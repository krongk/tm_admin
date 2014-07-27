class Templates::KeystoresController < ApplicationController
  before_action :set_templates_keystore, only: [:show, :edit, :update, :destroy]

  # GET /templates/keystores
  # GET /templates/keystores.json
  def index
    @templates_keystores = Templates::Keystore.all
  end

  # GET /templates/keystores/1
  # GET /templates/keystores/1.json
  def show
  end

  # GET /templates/keystores/new
  def new
    @templates_keystore = Templates::Keystore.new
  end

  # GET /templates/keystores/1/edit
  def edit
  end

  # POST /templates/keystores
  # POST /templates/keystores.json
  def create
    @templates_keystore = Templates::Keystore.new(templates_keystore_params)
    @template = templates_keystore_params[:source_type] == 'Templates::Template' ? Templates::Template.find(templates_keystore_params[:source_id]) : Templates::Page.find(templates_keystore_params[:source_id]).try(:template)
    
    respond_to do |format|
      if @templates_keystore.save
        format.html { redirect_to @template, notice: 'Keystore was successfully created.' }
        format.json { render action: 'show', status: :created, location: @templates_keystore }
      else
        format.html { render action: 'new' }
        format.json { render json: @templates_keystore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/keystores/1
  # PATCH/PUT /templates/keystores/1.json
  def update
    @template = templates_keystore_params[:source_type] == 'Templates::Template' ? Templates::Template.find(templates_keystore_params[:source_id]) : Templates::Page.find(templates_keystore_params[:source_id]).try(:template)

    respond_to do |format|
      if @templates_keystore.update(templates_keystore_params)
        format.html { redirect_to @template, notice: 'Keystore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @templates_keystore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/keystores/1
  # DELETE /templates/keystores/1.json
  def destroy
    @templates_keystore.destroy
    respond_to do |format|
      format.html { redirect_to templates_keystores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_templates_keystore
      @templates_keystore = Templates::Keystore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def templates_keystore_params
      params.require(:templates_keystore).permit(:source_type, :source_id, :key, :value)
    end
end
