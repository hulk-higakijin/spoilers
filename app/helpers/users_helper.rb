module UsersHelper
  def display_discussions?
    params[:display] == 'thread' || params[:display].nil?
  end

  def display_comments?
    params[:display] == 'comment'
  end
end
