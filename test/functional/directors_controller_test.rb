require 'test_helper'

class DirectorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:directors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create director" do
    assert_difference('Director.count') do
      post :create, :director => { }
    end

    assert_redirected_to director_path(assigns(:director))
  end

  test "should show director" do
    get :show, :id => directors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => directors(:one).to_param
    assert_response :success
  end

  test "should update director" do
    put :update, :id => directors(:one).to_param, :director => { }
    assert_redirected_to director_path(assigns(:director))
  end

  test "should destroy director" do
    assert_difference('Director.count', -1) do
      delete :destroy, :id => directors(:one).to_param
    end

    assert_redirected_to directors_path
  end
end
