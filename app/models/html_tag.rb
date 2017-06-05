class HtmlTag < ApplicationRecord
  belongs_to :page

  validates_presence_of :page
  validates_presence_of :content
end
