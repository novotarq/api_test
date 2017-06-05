class PageJob < ActiveJob::Base
  queue_as :page_job

  def perform(url)
    PageService.new(url).perform!
  end
end
