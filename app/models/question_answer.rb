class QuestionAnswer < ActiveRecord::Base
  scope :common_asked, -> {where common_asked: true}
  UPDATABLE_COLUMNS_FOR_QA_BY_API = [:question, :fullname, :email, :app_name]
  UPDATABLE_COLUMNS_FOR_QA = [:question, :answer, :title, :common_asked]

  validates :question, presence: true
end

