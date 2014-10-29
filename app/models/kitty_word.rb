class KittyWord < ActiveRecord::Base
  validates :name, presence: true
  validates :word, presence: true
  validates :level, presence: true,
   numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  UPDATABLE_COLUMNS_FOR_KITTYWORD = [:name, :word, :level, :memo]
end
