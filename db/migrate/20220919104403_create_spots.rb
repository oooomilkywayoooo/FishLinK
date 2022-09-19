class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.integer :spot_id

      t.timestamps
    end
  end
end
