class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
      # 同じユーザーが同じ投稿をお気に入りできないようにする
      t.index [:user_id, :post_id], unique: true
    end
  end
end
