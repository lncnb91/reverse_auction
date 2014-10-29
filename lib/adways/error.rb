module Adways::Error
  CODES = {
    unknown: 600,
    record_not_found: 601,
    not_enough_point: 602,
    invalid_access_token: 603,
    access_token_expired: 604,
    invitation_bonus_failed: 605
  }
  class Base < ::Exception
    def initialize *args
      if args.length == 0
        t_key = self.class.name.underscore.gsub(/\//, ".")
        super I18n.t(t_key)
      else
        super *args
      end
    end
  end
  module API
    module Common
      class Unknown < Adways::Error::Base
      end
    end
    module Kitty
      class EatSweetFailed < Adways::Error::Base
      end
      class InvitationBonusFailed < Adways::Error::Base
      end
    end
    module User
      class UserExchange < Adways::Error::Base
      end
    end
    module GiftItem
      class NotEnoughPoint < Adways::Error::Base
      end
    end
    module QuestionAnswer
      class CannotCreate < Adways::Error::Base
      end
    end
    module Session
      class InvalidAccessToken < Adways::Error::Base
      end
      class AccessTokenExpired < Adways::Error::Base
      end
    end
  end
end
