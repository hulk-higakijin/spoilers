FactoryBot.define do
  factory :anime do
    title             { "higakijinの物語" }
    image_url         { "https://pbs.twimg.com/profile_images/1639996872071974913/PPhYEW-B_400x400.jpg" }
    title_first       { "higakijin" }
    title_en          { "The story of higakijin" }
    web_url           { "https://higakijin.example.com" }
    twitter_account   { "higakijin" }
    twitter_hash_tag  { "higakijin" }
    sex               { "men" }
    sequel            { 1 }
    year              { 2023 }
    season            { "winter" }
  end
end
