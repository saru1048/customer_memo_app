require 'rails_helper'

RSpec.describe "ユーザーログイン", type: :system do
  it "社員番号とパスワードでログインし、メニュー画面を表示できる" do
    create(:user, employee_number: "1001", password: "password")

    visit new_user_session_path

    fill_in "社員番号", with: "1001"
    fill_in "パスワード", with: "password"
    click_button "ログイン"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("顧客対応管理アプリ")
    expect(page).to have_content("顧客登録")
    expect(page).to have_content("顧客検索")
    expect(page).to have_content("顧客対応一覧")
    expect(page).to have_content("接客記録登録")
    expect(page).to have_content("ログアウト")
  end

  it "社員番号が間違っている場合はログインできない" do
    create(:user, employee_number: "1001", password: "password")

    visit new_user_session_path

    fill_in "社員番号", with: "9999"
    fill_in "パスワード", with: "password"
    click_button "ログイン"

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content("社員番号")
    expect(page).to have_content("パスワード")
  end
  it "パスワードが間違っている場合はログインできない" do
    create(:user, employee_number: "1001", password: "password")

    visit new_user_session_path

    fill_in "社員番号", with: "1001"
    fill_in "パスワード", with: "wrong-password"
    click_button "ログイン"

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content("社員番号")
    expect(page).to have_content("パスワード")
  end
end
