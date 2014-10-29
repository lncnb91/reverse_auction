class Snowflake::SnowflakeNode < ActiveRecord::Base
  def self.get_next_id()
    obj = self.create!
    obj.id
  end
end
