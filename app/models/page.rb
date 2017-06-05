class Page < ApplicationRecord
  has_many :html_tags
  has_many :links

  validates_presence_of :url
end
