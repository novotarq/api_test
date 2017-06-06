require 'test_helper'

class PageTest < ActiveJob::TestCase
  test 'validations' do
    assert Page.new(url: '').invalid?
    assert Page.new(url: nil).invalid?
    assert Page.new(url: 'test').invalid?
    assert Page.new(url: 'http://test.com/').valid?
    assert Page.new(url: 'https://test.com/').valid?
  end

  test 'job enqueue' do
    assert_enqueued_with(job: PageJob) do
      Page.create!(url: 'http://google.com')
    end
  end
end
