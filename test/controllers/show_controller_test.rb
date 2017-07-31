require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get show_all_url
    assert_response :success
  end

  test "should get inside" do
    get show_inside_url
    assert_response :success
  end

end
