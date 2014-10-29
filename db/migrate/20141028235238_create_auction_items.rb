class CreateAuctionItems < ActiveRecord::Migration
  def change
    create_table :auction_items do |t|

      t.string :item_name
      t.date :auction_date
      t.timestamps
    end
  end
end
