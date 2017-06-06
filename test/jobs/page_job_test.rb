require 'test_helper'

class PageJobTest < ActiveJob::TestCase
  test 'enqueuning' do
    assert_enqueued_with(job: PageJob) do
      PageJob.perform_later(Page.create!(url: 'http://test.com'))
    end
  end
end
