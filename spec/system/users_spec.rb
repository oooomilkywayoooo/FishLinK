# frozen_string_literal: true

require "rails_helper"

describe "ユーザーのテスト" do
  describe "トップ画面のテスト" do
    before do
      visit "/"
    end
    context "表示の確認" do
      it "トップ画面に「FishLinKとは？」のリンクが表示されているか" do
        expect(page).to have_link "FishLinKとは？", href: "/about"
      end
      it "トップ画面に「釣果一覧」のリンクが表示されているか" do
        expect(page).to have_link "釣果一覧", href: posts_path
      end
      it "トップ画面に「新規登録」のリンクが表示されているか" do
        expect(page).to have_link "新規登録", href: new_user_registration_path
      end
      it "トップ画面に「ログイン」のリンクが表示されているか" do
        expect(page).to have_link "ログイン", href: new_user_session_path
      end
    end
  end
  describe "新規登録を行う" do
    let!(:user) { FactoryBot.create(:user) }
    # 新規登録ページに遷移する
    before do
      visit new_user_registration_path
    end
    it "登録に成功し、マイページに遷移するか" do
      # ニックネームを入力
      fill_in "user_nickname", with: "テスト"
      # 誕生日を入力
      select "1988", from: "user_birthdate_1i"
      select "12", from: "user_birthdate_2i"
      select "12", from: "user_birthdate_3i"
      # 性別を入力
      choose "user_sex_男"
      # emailを入力
      fill_in "user_email", with: "test@testmail.com"
      # パスワードを入力
      fill_in "user_password", with: "testuser123"
      # パスワード（確認）を入力
      fill_in "user_password_confirmation", with: "testuser123"
      # Sign upボタンを押す
      click_button "Sign up"
      expect(page).to have_content "successfully"
    end
  end
  describe "マイページ" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
      visit user_path(@user)
    end
    context "表示の確認" do
      it "編集リンクが表示されるか" do
        expect(page).to have_content "編集"
      end
      it "釣果投稿リンクが表示されるか" do
        expect(page).to have_content "釣果投稿"
      end
      it "レビュー投稿リンクが表示されるか" do
        expect(page).to have_content "レビュー投稿"
      end
    end
  end
end
