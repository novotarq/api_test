class Link < ApplicationRecord
  belongs_to :page

  validates_presence_of :page
  validates :url, presence: true, format: { with: URI::regexp(%w(http https)) }
end
