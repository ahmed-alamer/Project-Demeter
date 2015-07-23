require 'test_helper'

class GrantsControllerTest < ActionController::TestCase
  setup do
    @grant = grants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grant" do
    assert_difference('Grant.count') do
      post :create, grant: { amount: @grant.amount, approval_code: @grant.approval_code, entry_date: @grant.entry_date, project_id: @grant.project_id, receiver_wallet: @grant.receiver_wallet }
    end

    assert_redirected_to grant_path(assigns(:grant))
  end

  test "should show grant" do
    get :show, id: @grant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grant
    assert_response :success
  end

  test "should update grant" do
    patch :update, id: @grant, grant: { amount: @grant.amount, approval_code: @grant.approval_code, entry_date: @grant.entry_date, project_id: @grant.project_id, receiver_wallet: @grant.receiver_wallet }
    assert_redirected_to grant_path(assigns(:grant))
  end

  test "should destroy grant" do
    assert_difference('Grant.count', -1) do
      delete :destroy, id: @grant
    end

    assert_redirected_to grants_path
  end
end
