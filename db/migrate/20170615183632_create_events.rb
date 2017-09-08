class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :long
      t.string :lat
      t.string :color
      t.string :value
      t.integer :user_id
      t.timestamps(null: false)
    end
  end
end
