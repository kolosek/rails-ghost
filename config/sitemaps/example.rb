SitemapGenerator::Sitemap.default_host = "https://example.com"
SitemapGenerator::Sitemap.public_path = 'public/sitemaps/examplecom/' 
SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'monthly', priority: 0.9
  add '/pricing', changefreq: 'monthly', priority: 0.8
  add '/docs', changefreq: 'weekly', priority: 0.8
  add '/blog', changefreq: 'weekly', priority: 0.5
end