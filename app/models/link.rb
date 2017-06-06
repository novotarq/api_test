class Link < ApplicationRecord
  belongs_to :page

  validates_presence_of :page
  validates :url, presence: true
end
