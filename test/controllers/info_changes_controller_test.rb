require 'test_helper'

class InfoChangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info_change = info_changes(:one)
  end

  test "should get index" do
    get info_changes_url
    assert_response :success
  end

  test "should get new" do
    get new_info_change_url
    assert_response :success
  end

  test "should create info_change" do
    assert_difference('InfoChange.count') do
      post info_changes_url, params: { info_change: { comments: @info_change.comments, user_id: @info_change.user_id } }
    end

    assert_redirected_to info_change_url(InfoChange.last)
  end

  test "should show info_change" do
    get info_change_url(@info_change)
    assert_response :success
  end

  test "should get edit" do
    get edit_info_change_url(@info_change)
    assert_response :success
  end

  test "should update info_change" do
    patch info_change_url(@info_change), params: { info_change: { comments: @info_change.comments, user_id: @info_change.user_id } }
    assert_redirected_to info_change_url(@info_change)
  end

  test "should destroy info_change" do
    assert_difference('InfoChange.count', -1) do
      delete info_change_url(@info_change)
    end

    assert_redirected_to info_changes_url
  end
end
