class PageJobTest < ActiveJob::TestCase
  test 'nothing for now' do
    assert_no_enqueued_jobs do
      PageJob.perform_now('test')
    end
  end
end