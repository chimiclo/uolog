require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get show" do
    get profile_url
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url
    assert_response :success
  end

  test "should update profile" do
    patch profile_url, params: {
      profile: { name: "Updated Name" }
    }
    assert_response :redirect
  end
end
