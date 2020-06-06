require 'test_helper'

class FollowartistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get followartists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get followartists_destroy_url
    assert_response :success
  end

end
