class AddColumnsToAnimes < ActiveRecord::Migration[7.0]
  def change
    add_column :animes, :title_first, :string
    add_column :animes, :title_second, :string
    add_column :animes, :title_third, :string
    add_column :animes, :title_en, :string
    add_column :animes, :web_url, :string
    add_column :animes, :twitter_account, :string
    add_column :animes, :twitter_hash_tag, :string
    add_column :animes, :sex, :integer
    add_column :animes, :sequel, :integer, default: 1
    add_column :animes, :year, :integer
    add_column :animes, :season, :integer
  end
end
