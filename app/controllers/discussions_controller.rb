class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_anime
  before_action :set_discussion, only: [:show]

  def show
    @comments = @discussion.comments.with_deleted.order(created_at: :asc)
    @comment = current_user.comments.new(discussion: @discussion)
  end

  def new
    @discussion = current_user.discussions.new
  end

  def create
    @discussion = current_user.discussions.new(discussion_params)

    if @discussion.save
      redirect_to anime_discussion_path(@anime, @discussion)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def set_anime
      @anime = Anime.find(params[:anime_id])
    end

    def set_discussion
      @discussion = @anime.discussions.includes(comments: :user).find(params[:id])
    end

    def discussion_params
      params.require(:discussion).permit(:title).merge(anime_id: @anime.id)
    end
end
