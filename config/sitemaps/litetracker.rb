SitemapGenerator::Sitemap.default_host = "https://litetracker.com"
SitemapGenerator::Sitemap.create(filename: :sitemap_litetracker) do
  # --- Static pages ---
  add '/', changefreq: 'monthly', priority: 0.9
  add '/pricing', changefreq: 'monthly', priority: 0.8
  add '/about', changefreq: 'monthly', priority: 0.8
  add '/integrations', changefreq: 'monthly', priority: 0.8
  add '/onboard', changefreq: 'monthly', priority: 0.8
  add '/nesha', changefreq: 'monthly', priority: 0.8

  # --- Ghost blog posts ---
  ghost_client = GhostClient.new('litetracker.com')
  page = 1

  loop do
    posts = ghost_client.get_posts(page)
    break if posts.blank?

    posts.each do |post|
      add "/#{post['slug']}", 
          lastmod: post['updated_at'] || post['published_at'], 
          changefreq: 'monthly', 
          priority: 0.6
    end

    page += 1
  end
end