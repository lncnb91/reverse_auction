module Adways::InvitationCode
  LENGTH = 16

  def generate
    SecureRandom.hex LENGTH
  end

  module_function :generate
end
