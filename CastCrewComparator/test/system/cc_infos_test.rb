require "application_system_test_case"

class CcInfosTest < ApplicationSystemTestCase
  setup do
    @cc_info = cc_infos(:one)
  end

  test "visiting the index" do
    visit cc_infos_url
    assert_selector "h1", text: "Cc infos"
  end

  test "should create cc info" do
    visit cc_infos_url
    click_on "New cc info"

    fill_in "Knownfor", with: @cc_info.knownFor
    fill_in "Name", with: @cc_info.name
    fill_in "Picture", with: @cc_info.picture
    click_on "Create Cc info"

    assert_text "Cc info was successfully created"
    click_on "Back"
  end

  test "should update Cc info" do
    visit cc_info_url(@cc_info)
    click_on "Edit this cc info", match: :first

    fill_in "Knownfor", with: @cc_info.knownFor
    fill_in "Name", with: @cc_info.name
    fill_in "Picture", with: @cc_info.picture
    click_on "Update Cc info"

    assert_text "Cc info was successfully updated"
    click_on "Back"
  end

  test "should destroy Cc info" do
    visit cc_info_url(@cc_info)
    click_on "Destroy this cc info", match: :first

    assert_text "Cc info was successfully destroyed"
  end
end
