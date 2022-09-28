class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # GET /albums or /albums.json
  def index
    @albums = Album.all.order(created_at: :desc)
  end

  # GET /albums/1 or /albums/1.json
  def show; end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit; end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)
    @album.user = current_user
    respond_to do |format|
      if @album.save
        format.html { redirect_to album_url(@album), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to album_url(@album), notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    session[:current_user] = current_user
    respond_to do |format|
      if current_user.role_id == 1
        @album.destroy
        format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to albums_url, notice: 'You do not have permissions to delete an Album' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def album_params
    params.require(:album).permit(:album_name, :year, :artist)
  end
end
