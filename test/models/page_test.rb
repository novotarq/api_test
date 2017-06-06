require 'test_helper'

class PageTest < ActiveJob::TestCase
  def setup
    Page.create!(url: 'http://google.com/')
  end

  test 'validations' do
    assert Page.new(url: '').invalid?
    assert Page.new(url: nil).invalid?
    assert Page.new(url: 'test').invalid?
    assert Page.new(url: 'http://test.com/').valid?
    assert Page.new(url: 'https://test.com/').valid?
  end

  test 'uniqueness' do
    assert_raises ActiveRecord::RecordInvalid do
      Page.create!(url: 'http://google.com/')
    end
  end

  test 'job enqueue' do
    assert_enqueued_with(job: PageJob) do
      Page.create!(url: 'http://bing.com')
    end
  end

  test 'children create' do
    #create should create children
    #mock html response here
  end
end
