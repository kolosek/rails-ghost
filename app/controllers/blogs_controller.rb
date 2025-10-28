class BlogsController < ApplicationController
	layout :resolve_layout
	before_action :set_settings

	def index
		@posts = ghost_client.get_data(:posts, page: params[:page] || 1)
	end

	def show
		@post = ghost_client.get_data(:post, path: request.path)
	end

	private

	def resolve_layout
		layout_exists?(:blog) ? "#{app_name}/layouts/blog" : "#{app_name}/layouts/application"
	end
end
