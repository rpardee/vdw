require 'test_helper'

class SeveritiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:severities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create severity" do
    assert_difference('Severity.count') do
      post :create, :severity => { }
    end

    assert_redirected_to severity_path(assigns(:severity))
  end

  test "should show severity" do
    get :show, :id => severities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => severities(:one).to_param
    assert_response :success
  end

  test "should update severity" do
    put :update, :id => severities(:one).to_param, :severity => { }
    assert_redirected_to severity_path(assigns(:severity))
  end

  test "should destroy severity" do
    assert_difference('Severity.count', -1) do
      delete :destroy, :id => severities(:one).to_param
    end

    assert_redirected_to severities_path
  end
end
