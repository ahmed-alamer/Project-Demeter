require 'test_helper'

class ApprovalStatusesControllerTest < ActionController::TestCase
  setup do
    @approval_status = approval_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approval_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approval_status" do
    assert_difference('ApprovalStatus.count') do
      post :create, approval_status: { code: @approval_status.code, details: @approval_status.details }
    end

    assert_redirected_to approval_status_path(assigns(:approval_status))
  end

  test "should show approval_status" do
    get :show, id: @approval_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @approval_status
    assert_response :success
  end

  test "should update approval_status" do
    patch :update, id: @approval_status, approval_status: { code: @approval_status.code, details: @approval_status.details }
    assert_redirected_to approval_status_path(assigns(:approval_status))
  end

  test "should destroy approval_status" do
    assert_difference('ApprovalStatus.count', -1) do
      delete :destroy, id: @approval_status
    end

    assert_redirected_to approval_statuses_path
  end
end
