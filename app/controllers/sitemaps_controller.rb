class SitemapsController < ApplicationController
  def show
    folder = app_name.gsub(".", "")
    gz_path = Rails.root.join('public', 'sitemaps', folder, 'sitemap.xml.gz')

    if File.exist?(gz_path)
      xml = Zlib::GzipReader.open(gz_path, &:read)
      render xml: xml
    else
      render plain: "Sitemap not found", status: :not_found
    end
  end
end

