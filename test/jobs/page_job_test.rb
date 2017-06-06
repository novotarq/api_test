require 'test_helper'

class PageJobTest < ActiveJob::TestCase
  test 'enqueuing' do
    assert_enqueued_with(job: PageJob) do
      PageJob.perform_later(create(:page, url: 'http://test.com'))
    end
  end
end
