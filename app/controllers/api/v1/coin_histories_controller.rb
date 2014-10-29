class Api::V1::CoinHistoriesController < Api::BaseApiController

  def index
    @coin_histories = @user.coin_histories
  end
end
