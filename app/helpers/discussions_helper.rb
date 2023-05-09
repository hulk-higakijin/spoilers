module DiscussionsHelper
  def is_my_comment(comment)
    current_user.id == comment.user_id
  end

  def reverse_archival_status_word(discussion)
    discussion.archived? ? '再ディスカッション' : 'アーカイブする'
  end
end
