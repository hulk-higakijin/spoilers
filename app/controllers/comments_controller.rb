class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to anime_discussion_path(@discussion.anime, @discussion)
    else
      render 'discussions/show'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(discussion_id: @discussion.id)
    end

    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end
end
