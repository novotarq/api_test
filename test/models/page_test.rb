require 'test_helper'

class PageTest < ActiveSupport::TestCase
  should validate_presence_of :url
end
