require 'test_helper'

class PageJobTest < ActiveJob::TestCase
  test 'nothing for now' do
    assert_enqueued_with(job: PageJob) do
      PageJob.perform_later(Page.new('http://test.com'))
    end
  end
end
