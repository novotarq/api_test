require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def setup
    (1..5).each do |digit|
      create(:page, url: "http://google#{digit}.com")
    end
  end

  test 'index' do
    get :index
    assert_response :success
    (1..5).each do |digit|
      assert_includes @response.body, "http://google#{digit}.com"
    end
  end

  test 'valid create' do
    post :create, params: { page: { url: 'http://google.com' } }
    assert_response :success
  end

  test 'invalid create' do
    post :create, params: { page: { url: '' } }
    assert_response :unprocessable_entity
  end
end
