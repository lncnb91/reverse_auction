class CoinHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :promotion

  validates :user_id, :promotion_id, :point, presence: true
end
