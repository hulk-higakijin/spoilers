require 'rails_helper'

RSpec.describe "Devise::Registrations", type: :request do
  let(:valid_params) {{ user: {
    name: "higakijin",
    email: "higakijin@example.com",
    password: "iamhigakijin",
    password_confirmation: "iamhigakijin"
  }}}

  describe "GET /users/sign_up" do
    it "return status code 200" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    context "when valid params" do
      it "redirect to root path" do
        post user_registration_path(params: valid_params)
        expect(response).to redirect_to(root_path)
        expect(response).to have_http_status(303)
      end

      it "one more user's record is added" do
        expect do
          post user_registration_path(params: valid_params)
        end.to change(User, :count).by(1)
      end

      it "display notice messages" do
        # 調査
      end
    end

    context "when invalid params" do
      it "render status code 422" do
        post user_registration_path
        expect(response).to have_http_status(422)
      end

      it "render new template" do
        post user_registration_path
        expect(response).to render_template(:new)
      end

      it "display error messages" do
        post user_registration_path
        expect(response.body).to include("4件のエラーが発生したためユーザーは保存されませんでした。")
      end
    end
  end
end
