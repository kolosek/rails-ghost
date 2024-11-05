class PagesController < ApplicationController
	before_action :set_settings

	def post
		@posts = Rails.cache.fetch("posts", expires_in: 1.hour) do
			ghost_client.get_posts.reverse
		end
		@post = request.path == '/docs' ? 
			@posts.select {|p| p['custom_template'] == 'custom-documentation'}.first : ghost_client.get_post(request.path)

		if @post['custom_template'] == 'custom-documentation'
			render layout: 'docs'
		else
			render 'pages/blog', layout: 'blog'
		end
	end

	def blogs
		@posts  = Rails.cache.fetch("blogs", expires_in: 1.hour) do
			ghost_client.get_posts.select {|p| p['custom_template'] != 'custom-documentation'}
		end
		@fatured = @posts.select {|p| p['featured']}.first(3)

		render layout: 'blog'
	end

	private

	def ghost_client
		@ghost_client ||= GhostClient.new
	end

	def set_settings
		@settings = Rails.cache.fetch("ghost_settings", expires_in: 1.hour) do
			ghost_client.settings
		end
	end
end
