namespace :sitemap do
  desc "Generate all sitemaps"
  task :generate => :environment do
    Dir[Rails.root.join('config/sitemaps/*.rb')].each do |file|
      puts "Generating sitemap for #{File.basename(file, '.rb')}"
      load file
    end
  end
end