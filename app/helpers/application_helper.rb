module ApplicationHelper
  def anime_search_query
    "#{Anime::SEARCHABLE_ATTRIBUTES.join('_or_')}_cont".intern
  end
end
