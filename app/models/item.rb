class Item < ApplicationRecord
  has_many :bids
  has_many :bidders, through: :bids, source: :bidder 
  belongs_to :seller, class_name: :user, foreign_key: :seller_id
end
