class Page < ApplicationRecord
  has_many :html_tags
  has_many :links

  validates :url, presence: true, uniqueness: true, format: { with: URI::regexp(%w(http https)) }

  after_create :parse_content

  def to_json(*args)
    build_json_hash.to_json(*args)
  end

  private
  def parse_content
    PageJob.perform_later(self)
  end

  def build_json_hash
    json = { url: url, links: links.map(&:url) }
    (1..3).each do |elem|
      json["h#{elem}"] = html_tags.where(type: "h#{elem}").map(&:content)
    end
    json
  end
end
