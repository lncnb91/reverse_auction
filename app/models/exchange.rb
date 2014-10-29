class Exchange < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift_item

  scope :today_exchange, ->(date){where("created_at LIKE ?" , "%#{date}%")}
  scope :exchange_by_month, ->(month_and_year){where("created_at LIKE ?" , "%#{month_and_year}%")}

  UPDATABLE_COLUMNS_FOR_EXCHANGE = [:user_id, :gift_item_id, :point]
end
