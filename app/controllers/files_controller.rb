class FilesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]

	def show
    render file: Rails.root.join("app/views/#{app_name}/assets/#{params[:file_name]}.#{params[:format]}"), disposition: 'inline'
	end
end
