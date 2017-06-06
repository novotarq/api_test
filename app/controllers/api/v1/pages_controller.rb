class PagesController < BaseApiController
  # GET /pages
  def index
    @pages = Page.all
    json_response(@pages)
  end

  # POST /pages
  def create
    @page = Page.create!(page_params)
    json_response(@todo, :created)
  end

  private
  def page_params
    params.require(:url)
  end
end
