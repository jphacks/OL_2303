require "test_helper"

class ExpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exps_index_url
    assert_response :success
  end

  test "should get new" do
    get exps_new_url
    assert_response :success
  end
end
