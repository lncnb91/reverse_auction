class PricingPlay < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :auction_item, foreign_key: :auction_item_id
end
