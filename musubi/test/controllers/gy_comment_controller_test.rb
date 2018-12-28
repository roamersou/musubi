require 'test_helper'

class GyCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get gy_comment_edit_url
    assert_response :success
  end

end
