require 'test_helper'

class DatasetImplementationIssuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_implementation_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_implementation_issue" do
    assert_difference('DatasetImplementationIssue.count') do
      post :create, :dataset_implementation_issue => { }
    end

    assert_redirected_to dataset_implementation_issue_path(assigns(:dataset_implementation_issue))
  end

  test "should show dataset_implementation_issue" do
    get :show, :id => dataset_implementation_issues(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dataset_implementation_issues(:one).to_param
    assert_response :success
  end

  test "should update dataset_implementation_issue" do
    put :update, :id => dataset_implementation_issues(:one).to_param, :dataset_implementation_issue => { }
    assert_redirected_to dataset_implementation_issue_path(assigns(:dataset_implementation_issue))
  end

  test "should destroy dataset_implementation_issue" do
    assert_difference('DatasetImplementationIssue.count', -1) do
      delete :destroy, :id => dataset_implementation_issues(:one).to_param
    end

    assert_redirected_to dataset_implementation_issues_path
  end
end
