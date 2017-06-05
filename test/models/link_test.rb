require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  should validate_presence_of :page
  should validate_presence_of :url
end
