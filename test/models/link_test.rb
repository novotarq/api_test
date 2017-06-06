require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  should validate_presence_of :page

  def setup
    @page = Page.create!(url: 'http://google.com/')
  end

  test 'validations' do
    assert Link.new(url: '', page: @page).invalid?
    assert Link.new(url: nil, page: @page).invalid?
    assert Link.new(url: 'test', page: @page).invalid?
    assert Link.new(url: 'https://test.com/', page: nil).invalid?
    assert Link.new(url: 'http://test.com/', page: @page).valid?
    assert Link.new(url: 'https://test.com/', page: @page).valid?
  end
end
