class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_anime
  before_action :set_discussion, only: [:show]

  def show
    @comment = current_user.comments.new(discussion: @discussion)
  end

  private

    def set_anime
      @anime = Anime.find(params[:anime_id])
    end

    def set_discussion
      @discussion = @anime.discussions.includes(comments: :user).find(params[:id])
    end
end
