class CreateChargeLogs < ActiveRecord::Migration
  def change
    create_table :charge_logs do |t|

      t.integer :user_id, limit: 8
      t.integer :charged_gold
      t.timestamps
    end
  end
end
