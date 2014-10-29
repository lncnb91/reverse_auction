class News < ActiveRecord::Base
  scope :sorted, ->{ order("created_at desc") }
  scope :showing_news, -> { where ("public_from <= ? and public_until >= ?"), Time.now, Time.now}
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :public_from, presence: true
  validates :public_until, presence: true

  UPDATABLE_COLUMNS_FOR_ADMINS = [:title, :content, :public_from, :public_until]

  class << self
    def with_formated_date news
      news.map do |n|
        {
          id: n.id,
          title: n.title,
          content: n.content,
          created_at: n.created_at.time_to_date,
          updated_at: n.updated_at.time_to_date
        }
      end
    end
  end
end
