require 'test_helper'

class PageTest < ActiveJob::TestCase
  def setup
    create(:page, url: 'http://google.com/')
  end

  test 'validations' do
    assert build(:page, url: '').invalid?
    assert build(:page, url: nil).invalid?
    assert build(:page, url: 'test').invalid?
    assert build(:page, url: 'http://test.com/').valid?
    assert build(:page, url: 'https://test.com/').valid?
  end

  test 'uniqueness' do
    assert_raises ActiveRecord::RecordInvalid do
      create(:page, url: 'http://google.com/')
    end
  end

  test 'job enqueue' do
    assert_enqueued_with(job: PageJob) do
      create(:page, url: 'http://bing.com')
    end
  end
end
