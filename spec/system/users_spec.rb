# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザーのテスト' do
  let!(:user) { FactoryBot.create(:user) }
  describe 'トップ画面のテスト' do
    before do
      visit '/'
    end
    context '表示の確認' do
      it 'トップ画面に「FishLinKとは？」のリンクが表示されているか' do
        expect(page).to have_link "FishLinKとは？", href: '/about'
      end
      it 'トップ画面に「釣果一覧」のリンクが表示されているか' do
        expect(page).to have_link "釣果一覧", href: posts_path
      end
      it 'トップ画面に「新規登録」のリンクが表示されているか' do
        expect(page).to have_link "新規登録", href: new_user_registration_path
      end
      it 'トップ画面に「ログイン」のリンクが表示されているか' do
        expect(page).to have_link "ログイン", href: new_user_session_path
      end
    end
  end
  describe '新規登録を行う' do
    # 新規登録ページに遷移する
    before do
      visit new_user_registration_path
    end
    it '登録に成功し、サクセスメッセージが表示されるか' do
      # ニックネームを入力
      fill_in 'user_nickname', with: user.nickname
      # 誕生日を入力
      select '1988', from: 'user_birthdate_1i'
      select '12', from: 'user_birthdate_2i'
      select '12', from: 'user_birthdate_3i'
      # emailを入力
      fill_in 'user_email', with: user.email
      # パスワードを入力
      fill_in 'user_password', with: user.password
      # パスワード（確認）を入力
      fill_in 'user_password_confirmation', with: user.password_confirmation
      # Sign upボタンを押す
      click_button 'Sign up'
      expect(page).to have_content 'successfully'
    end
  end
end
