require "test_helper"

class Public::InstrumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_instruments_new_url
    assert_response :success
  end

  test "should get show" do
    get public_instruments_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_instruments_edit_url
    assert_response :success
  end
end
