require 'singleton'

class Snowflake::Generator
  include Singleton

  # time - 41 bits (millisecond precision w/ a custom epoch gives us 69 years)
  TIME_BIT = 41 #unused
  TIME_BIT_MASK = 0x1ffffffffff
  TIME_OFFSET = 1288834974657

  # node id - 10 bits - gives us up to 1024 nodes
  NODE_BIT = 10
  NODE_BIT_MASK = 0x3ff
  @@node_id = nil

  # Sequence number - 12 bits
  # rolls over every 4096 per machine (with protection to avoid rollover in the same ms)
  SEQUENCE_BIT = 12
  SEQUENCE_BIT_MASK = 0xfff
  SEQUENCE_MOD = 1024
  @@sequence_num = 0

  public

  # called when ActiveRecored create instance
  def self.get_next_id
    time = read_time & TIME_BIT_MASK
    node_id = read_node_id & NODE_BIT_MASK
    sequence_num = read_sequence_num & SEQUENCE_BIT_MASK

    (time << NODE_BIT+SEQUENCE_BIT) | (node_id << SEQUENCE_BIT) | sequence_num
  end

  # called 1/1h
  def self.clear_node_id
    @@node_id = Snowflake::SnowflakeNode.get_next_id
  end

  private

  def self.read_time
    (Time.now.to_f * 1000).to_i - TIME_OFFSET
  end

  # get node id from db
  def self.read_node_id
    if @@node_id.nil?
      clear_node_id
    end
    @@node_id
  end

  def self.read_sequence_num
    @@sequence_num += 1
    @@sequence_num %= SEQUENCE_MOD
    return @@sequence_num
  end
end
