class CreatePricingPlays < ActiveRecord::Migration
  def change
    create_table :pricing_plays do |t|

      t.integer :user_id, limit: 8
      t.integer :auction_item_id
      t.integer :set_price
      t.timestamps
    end
  end
end
