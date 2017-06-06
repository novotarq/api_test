class PageService
  def initialize(page)
    @page = page
  end

  def perform!
    doc = open_and_read(@page.url)
    handle_links(doc)
    ['h1', 'h2', 'h3'].each do |h|
      handle_h_elements(doc, h)
    end
  end

  def open_and_read(url)
    require 'open-uri'
    Nokogiri::HTML(open(url))
  end

  private
  def handle_h_elements(doc, name)
    hs = doc.css(name).map { |h| h.inner_html }.reject(&:empty?)
    hs.each do |h|
      name.classify.constantize.create!(content: h, page: @page)
    end
  end

  def handle_links(doc)
    hrefs = doc.css('a').map { |link| link['href'] }.reject(&:empty?)
    hrefs.each do |href|
      Link.create!(url: href, page: @page)
    end
  end
end
