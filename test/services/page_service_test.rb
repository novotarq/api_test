require 'test_helper'

class PageServiceTest < ActiveSupport::TestCase

  def setup
    @mock_file = Nokogiri::HTML::Document.parse('<html><h1>a</h1><h2>b</h2><a href="http://test.com">Test</a><a href="http://test2.com">Test</a></html>')
  end

  test 'children create' do
    page_service = PageService.new(build(:page, url: 'http://'))
    assert_changes 'Link.count' do
      page_service.stub :open_and_read, @mock_file do
        page_service.perform!
      end
    end
  end
end
