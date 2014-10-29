class AuctionItem < ActiveRecord::Base
  has_many :pricing_plays, foreign_key: :auction_item_id, dependent: :destroy
  UPDATABLE_COLUMNS_FOR_AUCTION_ITEMS = [:item_name, :auction_date]
end
