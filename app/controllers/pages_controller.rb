class PagesController < BaseApiController
  # GET /pages
  def index
    @pages = Page.all
    json_response(@pages)
  end

  # POST /pages
  def create
    @page = Page.create!(page_params)
    json_response(@page, :created)
  end

  private
  def page_params
    params.require(:page).permit(:url)
  end
end
