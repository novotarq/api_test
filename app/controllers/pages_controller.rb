class PagesController < BaseApiController
  # GET /pages
  def index
    @pages = Page.all.map(&:to_json)
    json_response(@pages)
  end

  # POST /pages
  def create
    @page = Page.create!(page_params)
    json_response(@page.url, :created)
  end

  private
  def page_params
    params.require(:page).permit(:url)
  end
end
