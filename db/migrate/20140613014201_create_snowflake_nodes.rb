class CreateSnowflakeNodes < ActiveRecord::Migration
  def change
    create_table :snowflake_nodes do |t|

      t.timestamps
    end
  end
end
