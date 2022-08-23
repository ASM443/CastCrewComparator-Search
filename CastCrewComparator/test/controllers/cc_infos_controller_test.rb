require "test_helper"

class CcInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cc_info = cc_infos(:one)
  end

  test "should get index" do
    get cc_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_cc_info_url
    assert_response :success
  end

  test "should create cc_info" do
    assert_difference("CcInfo.count") do
      post cc_infos_url, params: { cc_info: { knownFor: @cc_info.knownFor, name: @cc_info.name, picture: @cc_info.picture } }
    end

    assert_redirected_to cc_info_url(CcInfo.last)
  end

  test "should show cc_info" do
    get cc_info_url(@cc_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_cc_info_url(@cc_info)
    assert_response :success
  end

  test "should update cc_info" do
    patch cc_info_url(@cc_info), params: { cc_info: { knownFor: @cc_info.knownFor, name: @cc_info.name, picture: @cc_info.picture } }
    assert_redirected_to cc_info_url(@cc_info)
  end

  test "should destroy cc_info" do
    assert_difference("CcInfo.count", -1) do
      delete cc_info_url(@cc_info)
    end

    assert_redirected_to cc_infos_url
  end
end
