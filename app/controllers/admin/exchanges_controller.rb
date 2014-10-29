class Admin::ExchangesController < Admin::BaseController
  before_action :set_object, only: [:show]

  def index
    @q = Exchange.search params[:q]
    @exchanges = @q.result.page params[:page]
  end

  def show
  end

  private
  def set_object
    @exchange = Exchange.find params[:id]
  end
end
