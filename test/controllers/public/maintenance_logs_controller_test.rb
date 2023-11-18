require "test_helper"

class Public::MaintenanceLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_maintenance_logs_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_maintenance_logs_edit_url
    assert_response :success
  end

  test "should get index" do
    get public_maintenance_logs_index_url
    assert_response :success
  end
end
