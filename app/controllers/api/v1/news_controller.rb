class Api::V1::NewsController < Api::BaseApiController
  before_action :build_object, only: [:show]
  def index
    @newss = News.showing_news.sorted
  end

  def show
  end

  private
  def build_object
    @news = News.find params[:id]
  end
end
