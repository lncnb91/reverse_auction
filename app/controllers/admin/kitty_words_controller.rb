class Admin::KittyWordsController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:edit, :update, :destroy, :show]

  def index
    @q = KittyWord.search params[:q]
    @kitty_words = @q.result.page params[:page]
  end

  def show
  end

  def new
  end

  def create
    @kitty_word.attributes = kitty_word_params
    if @kitty_word.save
      redirect_to admin_kitty_words_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @kitty_word.attributes = kitty_word_params
    if @kitty_word.save
      redirect_to admin_kitty_words_path
    else
      render :edit
    end
  end

  def destroy
    @kitty_word.destroy
    redirect_to admin_kitty_words_path
  end

  private
  def build_object
    @kitty_word = KittyWord.new
  end

  def kitty_word_params
    params.require(:kitty_word).permit KittyWord::UPDATABLE_COLUMNS_FOR_KITTYWORD
  end

  def set_object
    @kitty_word = KittyWord.find params[:id]
  end
end
