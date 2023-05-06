module DiscussionsHelper
  def is_my_comment(comment)
    current_user.id == comment.user_id
  end
end
