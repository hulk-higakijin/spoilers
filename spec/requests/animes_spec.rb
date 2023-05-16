require 'rails_helper'

RSpec.describe "Animes", type: :request do
  let(:anime) { create(:anime) }

  describe "GET /animes" do
    it "return status code 200" do
      get animes_path
      expect(response).to have_http_status(200)
    end

    # 検索結果が正しく表示されるかのテストを実装する
  end

  describe "GET /animes/:id" do
    context "when anime is found" do
      it "retrun status code 200" do
        get anime_path(anime)
        expect(response).to have_http_status(200)
      end
  
      it "include anime's title" do
        get anime_path(anime)
        expect(response.body).to include(anime.title)
      end

      it "include anime's discussions" do

      end
    end

    context "when anime is not found" do
      it "raise Not found error" do
        expect do
          get anime_path("123456789")
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
