# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト', type: :system do
  before do
    @post = FactoryBot.build(:post)
    @user = FactoryBot.create(:user)
  end

  describe 'トップ画面のテスト' do
    before do
      visit '/'
    end
    context '表示の確認' do
      it 'トップ画面に「12時間ごとの天気」が表示されているか' do
        expect(page).to have_content '12時間ごとの天気'
      end
      it 'トップ画面が"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end
end