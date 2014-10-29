class Kitty < ActiveRecord::Base
  attr_accessor :level_up_flag
  belongs_to :user, foreign_key: :user_id
  has_many :level_up_histories
  before_create :generate_kitty_id
  PROGRESS = {
    "normal_apple" => 20,
    "golden_apple" => 100,
    "max" => 100
  }

  def eat_sweets sweet_type
    begin
      transaction do
        if self.calc_sweet sweet_type, -1
          self.calc_progress PROGRESS["#{sweet_type}"]
          self.save!
        else
          return false
        end
      end
    rescue ActiveRecord::RecordInvalid
      return false
    end
  end

  def calc_progress point
    max = PROGRESS["max"]
    progress = self.progress + point
    if progress >= max
      self.progress = progress - max
      self.level_up
    else
      self.progress = progress
      self.level_up_flag = 0
    end
  end

  def level_up
    self.level += 1
    self.level_up_flag = 1
    self.level_up_histories.create!(new_level: self.level,
      old_level: self.level - 1)
  end

  def calc_sweet sweet_type, number
    (self.send("#{sweet_type}=", self.send(sweet_type)  + number)) >= 0
  end

  def invitation_bonus
    self.golden_apple += 1
    raise ActiveRecord::RecordNotSaved
      .new(I18n.t :can_not_update_kitty, scope: [:errors, :messages]) unless self.save
  end

  private
  def generate_kitty_id
    self.kitty_id = Snowflake::Generator.get_next_id unless
      self.kitty_id && self.kitty_id != 0
  end
end
