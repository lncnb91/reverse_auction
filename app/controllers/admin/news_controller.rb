class Admin::NewsController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:show, :edit, :update, :destroy]

  def index
    @q = News.search params[:q]
    @newss = @q.result.sorted
  end

  def show
  end

  def new
  end

  def create
    @news.attributes = news_params
    if @news.save
      redirect_to :back
    else
      render :new
    end
  end

  def edit
  end

  def update
    @news.attributes = news_params
    if @news.save
      redirect_to admin_news_index_path
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to admin_news_index_path
  end

  private
  def build_object
    @news = News.new
  end

  def news_params
    params.require(:news).permit News::UPDATABLE_COLUMNS_FOR_ADMINS
  end

  def set_object
    @news = News.find params[:id]
  end
end
