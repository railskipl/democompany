base_url = "http://localhost:3000"
xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  @other_routes.each do |other|
    xml.url {
      xml.loc("http://localhost:3000#{other}")
      xml.changefreq("daily")
    }
  end
 
end
