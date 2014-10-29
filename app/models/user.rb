class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  set_primary_key = "user_id"
  UPDATABLE_COLUMNS_FOR_USERS = [:user_name, :remaining_gold]

  validates :remaining_gold, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      message: I18n.t("errors.messages.not_enough_point")
    }

  before_create :generate_user_id


  private
  def generate_user_id
    self.user_id = Snowflake::Generator.get_next_id unless
      self.user_id && self.user_id != 0
  end
end
