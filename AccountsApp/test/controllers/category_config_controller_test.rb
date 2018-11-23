require 'test_helper'

class CategoryConfigControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category_config_index_url
    assert_response :success
  end

end
