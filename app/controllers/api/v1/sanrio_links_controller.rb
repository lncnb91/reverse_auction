class Api::V1::SanrioLinksController < Api::BaseApiController

  def index
    @sanrio_links = SanrioLink.all
  end
end
