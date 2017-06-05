class Link < ApplicationRecord
  belongs_to :page

  validates_presence_of :url
  validates_presence_of :page
end
