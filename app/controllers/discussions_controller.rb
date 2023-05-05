class DiscussionsController < ApplicationController
  before_action :set_anime
  before_action :set_discussion, only: [:show]

  def show; end

  private

    def set_anime
      @anime = Anime.find(params[:anime_id])
    end

    def set_discussion
      @discussion = @anime.discussions.find(params[:id])
    end
end
