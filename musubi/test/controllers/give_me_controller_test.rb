require 'test_helper'

class GiveMeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get give_me_index_url
    assert_response :success
  end

end
