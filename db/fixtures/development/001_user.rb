require 'csv'

batch_size = 1700

def hyphen_check(word)
  word.strip == "-" ? nil : word
end

def zero_to_one(sequel)
  sequel.to_i == 0 ? 1 : sequel.to_i
end

CSV.foreach('db/fixtures/csv/anime_list.csv', headers: true).each_slice(batch_size) do |csv_batch|
  records = csv_batch.map do |row|
    {
      title: row["Title"],
      image_url: hyphen_check(row["Thumbnail url"]),
      title_first: hyphen_check(row["Title short1"]),
      title_second: hyphen_check(row["Title short2"]),
      title_third: hyphen_check(row["Title short3"]),
      title_en: hyphen_check(row["Title en"]),
      web_url: hyphen_check(row["Public url"]),
      twitter_account: row["Twitter account"],
      twitter_hash_tag: row["Twitter hash tag"],
      sex: row["Sex"],
      sequel: zero_to_one(row["Sequel"]),
      year: row["Year"].to_i,
      season: row["Season"],
    }
  end

  Anime.seed(records)
end


