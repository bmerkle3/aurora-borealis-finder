class CreateBids < ActiveRecord::Migration[5.0]
  def change
      create_table :bids do |t|
        t.string :amount, null: false  
        t.integer :bidder_id
        t.integer :item_id
        t.timestamps(null: false)
      end
  end
end
