class Page < ApplicationRecord
  has_many :html_tags
  has_many :links

  validates_presence_of :url

  after_create :parse_content

  private
  def parse_content
    PageJob.perform_later(url)
  end
end
