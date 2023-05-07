class AnimesController < ApplicationController
  before_action :set_anime, only: %i[show]

  def index
    @animes = Anime.all
  end

  def show
    @discussions = @anime.discussions.order(created_at: :desc)
  end

  private

    def set_anime
      @anime = Anime.includes(discussions: :user).find(params[:id])
    end

    def anime_params
      params.require(:anime).permit(:title, :image_url)
    end
end
