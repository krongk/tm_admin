class Resource::MusicsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_resource_music, only: [:show, :edit, :update, :destroy]

  # GET /resource/musics
  # GET /resource/musics.json
  def index
    @resource_musics = Resource::Music.order("updated_at DESC").page(params[:page])
  end

  # GET /resource/musics/1
  # GET /resource/musics/1.json
  def show
  end

  # GET /resource/musics/new
  def new
    @resource_music = Resource::Music.new
  end

  # GET /resource/musics/1/edit
  def edit
  end

  # POST /resource/musics
  # POST /resource/musics.json
  def create
    @resource_music = Resource::Music.new(resource_music_params)

    respond_to do |format|
      if @resource_music.save
        format.html { redirect_to resource_musics_path, notice: 'Music was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource_music }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource_music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource/musics/1
  # PATCH/PUT /resource/musics/1.json
  def update
    respond_to do |format|
      if @resource_music.update(resource_music_params)
        format.html { redirect_to resource_musics_path, notice: 'Music was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource_music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource/musics/1
  # DELETE /resource/musics/1.json
  def destroy
    @resource_music.destroy
    respond_to do |format|
      format.html { redirect_to resource_musics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_music
      @resource_music = Resource::Music.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_music_params
      params.require(:resource_music).permit(:name, :url)
    end
end
