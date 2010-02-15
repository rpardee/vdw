require 'test_helper'

class DatasetImplementationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_implementations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_implementation" do
    assert_difference('DatasetImplementation.count') do
      post :create, :dataset_implementation => { }
    end

    assert_redirected_to dataset_implementation_path(assigns(:dataset_implementation))
  end

  test "should show dataset_implementation" do
    get :show, :id => dataset_implementations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dataset_implementations(:one).to_param
    assert_response :success
  end

  test "should update dataset_implementation" do
    put :update, :id => dataset_implementations(:one).to_param, :dataset_implementation => { }
    assert_redirected_to dataset_implementation_path(assigns(:dataset_implementation))
  end

  test "should destroy dataset_implementation" do
    assert_difference('DatasetImplementation.count', -1) do
      delete :destroy, :id => dataset_implementations(:one).to_param
    end

    assert_redirected_to dataset_implementations_path
  end
end
