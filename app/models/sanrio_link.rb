class SanrioLink < ActiveRecord::Base
  UPDATABLE_COLUMNS_FOR_ADMINS = [:title, :description, :logo_link, :link]

  validates :title, :description, :logo_link, :link, presence: true
end
