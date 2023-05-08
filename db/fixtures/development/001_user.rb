require 'csv'

CSV.foreach('db/fixtures/csv/anime_list.csv', headers: true) do |row|
  p row['Title']
end
