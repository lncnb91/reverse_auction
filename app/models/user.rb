class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  set_primary_key = "user_id"
  has_one :session, dependent: :destroy
  has_one :kitty, dependent: :destroy
  has_many :login_histories
  has_many :exchanges
  has_many :invitation_bonuses
  has_many :friends, through: :invitation_bonuses, class_name: User.name
  has_many :coin_histories
  UPDATABLE_COLUMNS_FOR_USERS = [:media_user_info, :ad_id, :device_type]

  validates :remained_point, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      message: I18n.t("errors.messages.not_enough_point")
    }

  before_create :generate_user_id
  before_create :create_kitty
  before_create :gen_invitation_code
  before_create :set_last_login

  def make_exchange item, point
    self.remained_point -= point.to_i
    self.exchanged_point += point.to_i
    self.exchanges.build(gift_item_id: item, point: point)
  end

  def update_ad_id ad_id
    self.ad_id = ad_id
    self.save
  end

  def create_session
    self.build_session
    self.save
    self.session
  end

  def received_invitation_bonus_by? friend
    (self.friends.include? friend) || (friend.friends.include? self)
  end

  def check_login_bonus
    if self.last_login == Date.today
      login_bonus = 0
    else
      self.continuos_login_count = (Date.today == self.last_login + 1.day) ?
        self.continuos_login_count + 1 : 1
      self.last_login = Date.today
      login_bonus = self.continuos_login_count % 5 == 0 ? 5 : 1
      self.remained_point += login_bonus
    end
    self.save
    login_bonus
  end

  private
  def generate_user_id
    self.user_id = Snowflake::Generator.get_next_id unless
      self.user_id && self.user_id != 0
  end

  def create_kitty
    self.build_kitty
  end

  def gen_invitation_code
    self.invitation_code = Adways::InvitationCode.generate
  end

  def set_last_login
    self.continuos_login_count = 1
    self.remained_point = 1
    self.last_login = Date.today
  end
end
