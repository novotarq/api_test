require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  should validate_presence_of :page

  def setup
    @page = create(:page)
  end

  test 'validations' do
    assert build(:link, url: '', page: @page).invalid?
    assert build(:link, url: nil, page: @page).invalid?
    assert build(:link, url: 'test', page: @page).valid?
    assert build(:link, url: 'https://test.com/', page: nil).invalid?
    assert build(:link, url: 'http://test.com/', page: @page).valid?
    assert build(:link, url: 'https://test.com/', page: @page).valid?
  end
end
