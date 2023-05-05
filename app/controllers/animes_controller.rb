class AnimesController < ApplicationController
  before_action :set_anime, only: %i[show edit update destroy]

  def index
    @animes = Anime.all
  end

  def show; end

  def new
    @anime = Anime.new
  end

  def edit; end

  def create
    @anime = Anime.new(anime_params)

    respond_to do |format|
      if @anime.save
        format.html { redirect_to anime_url(@anime) }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to anime_url(@anime) }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @anime.destroy

    respond_to do |format|
      format.html { redirect_to animes_url }
      format.json { head :no_content }
    end
  end

  private

    def set_anime
      @anime = Anime.find(params[:id])
    end

    def anime_params
      params.require(:anime).permit(:title, :image_url)
    end
end
