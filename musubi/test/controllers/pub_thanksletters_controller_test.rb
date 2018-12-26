require 'test_helper'

class PubThankslettersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pub_thanksletters_index_url
    assert_response :success
  end

end
