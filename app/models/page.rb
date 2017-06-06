class Page < ApplicationRecord
  has_many :html_tags
  has_many :links

  validates :url, presence: true, format: { with: URI::regexp(%w(http https)) }

  after_create :parse_content

  private
  def parse_content
    PageJob.perform_later(self)
  end
end
