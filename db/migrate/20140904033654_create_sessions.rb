class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|

      t.integer :user_id, :limit => 8
      t.string :access_token
      t.datetime :expired_at
      t.timestamps
    end
  end
end
