class CommonQuestionAnswer < ActiveRecord::Base
  validates :title, presence: true
  validates :question, presence: true
  validates :answer, presence: true
  UPDATABLE_COLUMNS_FOR_COMMON_QA = [:question, :answer, :title]
end
