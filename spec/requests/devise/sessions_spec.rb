require 'rails_helper'

RSpec.describe "Devise::Sessions", type: :request do
  let!(:user) { create(:user) }
  let(:valid_params) {{ user: { email: user.email, password: user.password }}}

  describe "GET /users/sign_in" do
    it "return status code 200" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users/sign_in" do
    context "when email and password are correct" do
      it "redirect to root path" do
        post user_session_path(params: valid_params)
        expect(response).to redirect_to(root_path)
      end

      it "alert error messages" do
        # あとで調査
      end
    end

    context "when email and password are incorrect" do
      it "render status code 422" do
        post user_session_path
        expect(response).to have_http_status(422)
      end

      it "display notice messages" do
        post user_session_path
        expect(response.body).to include("Eメールまたはパスワードが違います。")
      end
    end
  end
end
