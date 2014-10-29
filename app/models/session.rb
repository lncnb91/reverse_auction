class Session < ActiveRecord::Base
  SESSION_LIFETIME = 2.days
  belongs_to :user, foreign_key: :user_id
  after_initialize :set_access_token
  before_create :set_expiration_time

  def expired?
    self.expired_at < Time.now
  end

  def available?
    not expired?
  end

  def replace
    user_id = self.user_id
    self.destroy
    Session.create(user_id: user_id)
  end

  class << self
    def get_user access_token
      session = self.find_by_access_token(access_token)
      if session
        raise Adways::Error::API::Session::AccessTokenExpired
          .new(I18n.t :token_expired, scope: [:errors, :messages]) if session.expired?
        session.user
      else
        raise Adways::Error::API::Session::InvalidAccessToken
          .new(I18n.t :token_invalid, scope: [:errors, :messages])
      end
    end

    def check_for_login user_id
      session = Session.find_by(user_id: user_id)
      if session.expired?
        session.replace
      else
        session
      end
    end

    def access_token user_id
      self.find_by_user_id.access_token
    end
  end

  private
  def set_access_token
    self.access_token ||= Adways::Token.generate
  end

  def set_expiration_time
    self.expired_at = Time.now + SESSION_LIFETIME
  end
end
