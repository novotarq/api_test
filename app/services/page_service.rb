class PageService
  def initialize(page)
    @page = page
  end

  def perform!
    require 'open-uri'
    doc = Nokogiri::HTML(open(@page.url))
    hrefs = doc.css('a').map { |link| link['href'] }.reject(&:empty?)
    hrefs.each do |href|
      Link.create!(url: href, page: @page)
    end
  end
end
