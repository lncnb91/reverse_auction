class Api::BaseApiController < ApplicationController
  protect_from_forgery with: :null_session
  extend Adways::ErrorHandling

  define_handle_exception_methods
  handle_as_internal_server_error Exception, error_code: Adways::Error::CODES[:unknown]
  handle_as_internal_server_error ActiveRecord::RecordNotFound , error_code: Adways::Error::CODES[:record_not_found]
  protect_from_forgery with: :null_session

  before_action :check_access_token

  private
  def check_access_token
    @user = Session.get_user params[:access_token]
  end
end
