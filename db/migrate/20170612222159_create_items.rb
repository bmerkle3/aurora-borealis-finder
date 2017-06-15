class CreateItems < ActiveRecord::Migration[5.0]
  def change
      create_table :items do |t|
        t.string :name, null: false
        t.integer :user_id
        t.string :condition
        t.string :description
        t.datetime :start_time
        t.datetime :end_time

        t.timestamps(null: false)
      end
  end
end
