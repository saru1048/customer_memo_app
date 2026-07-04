require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    context "未ログインの場合" do
      it "ログイン画面へリダイレクトする" do
        get root_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
