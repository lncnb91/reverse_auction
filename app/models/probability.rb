class Probability < ActiveRecord::Base
  validates :fail, presence: true
  validates :one_apple, presence: true
  validates :three_apple, presence: true
  validates :golden_apple, presence: true
  before_validation :check_probability?
  UPDATABLE_COLUMNS_FOR_ADMINS = [:fail, :one_apple, :three_apple, :golden_apple]

  def probabilities_sum
    self.fail.to_i + self.one_apple.to_i + self.three_apple.to_i + self.golden_apple.to_i
  end

  private
  def check_probability?
    self.errors.add(:invalid_probability, "Probabilities sum must be 100") if
      self.probabilities_sum != 100
  end
end
