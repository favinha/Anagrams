class UploadController < ApplicationController
  def upload_dictionary
    reset_session
    Dictionary.parse_file(params[:upload])
    redirect_to root_url
  end
end
