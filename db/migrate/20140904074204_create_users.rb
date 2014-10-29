class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :id => false do |t|

      t.integer :user_id, :limit => 8
      t.string :user_name
      t.integer :remaining_gold, default: 0
      t.integer :play_count
      t.timestamps
    end
    execute "ALTER TABLE users ADD PRIMARY KEY (user_id);"
  end
end
