module UsersHelper
  def display_discussions?
    params[:display] == 'thread' || params[:display].nil?
  end

  def display_comments?
    params[:display] == 'comment'
  end

  def confirmation_message
    '【重要】アカウントに関する全ての情報が削除されます。この操作は取り消せません。本当に削除しますか？'
  end
end
