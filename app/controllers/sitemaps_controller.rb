class SitemapsController < ApplicationController
  def show
    sitemap_file = 'sitemap.xml.gz'
    folder = app_name.gsub(".", "")

    path = Rails.root.join('public', 'sitemaps', folder , sitemap_file)

    if File.exist?(path)
      send_file path, type: 'application/gzip', disposition: 'inline'
    else
      render plain: "Sitemap not found", status: :not_found
    end
  end
end
