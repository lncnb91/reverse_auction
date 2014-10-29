class Admin::AuctionItemsController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    @q = AuctionItem.search params[:q]
    @auction_items = @q.result
  end

  def new
  end

  def create
    @auction_item.attributes = auction_item_params
    if @auction_item.save
      redirect_to :back, notice: "success"
    else
      render :new
    end
  end

  def destroy
    @auction_item.destroy
    redirect_to admin_auction_items_path
  end

  private
  def build_object
    @auction_item = AuctionItem.new
  end

  def auction_item_params
    params.require(:auction_item).permit AuctionItem::UPDATABLE_COLUMNS_FOR_AUCTION_ITEMS
  end

  def set_object
    @auction_item = AuctionItem.find params[:id]
  end
end
