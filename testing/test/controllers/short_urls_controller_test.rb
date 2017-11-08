require 'test_helper'

class ShortUrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get short_urls_new_url
    assert_response :success
  end

  test "should get create" do
    get short_urls_create_url
    assert_response :success
  end

end
