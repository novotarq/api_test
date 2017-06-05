require 'test_helper'

class HtmlTagTest < ActiveSupport::TestCase
  should validate_presence_of :page
  should validate_presence_of :content
end
