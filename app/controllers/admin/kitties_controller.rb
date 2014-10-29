class Admin::KittiesController < Admin::BaseController
  before_action :set_object, only: [:show]

  def index
  end

  def show
  end

  private
  def set_object
    @kitty = Kitty.find params[:id]
  end
end
