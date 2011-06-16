require 'test_helper'

class BeatsControllerTest < ActionController::TestCase
  setup do
    @beat = beats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beat" do
    assert_difference('Beat.count') do
      post :create, :beat => @beat.attributes
    end

    assert_redirected_to beat_path(assigns(:beat))
  end

  test "should show beat" do
    get :show, :id => @beat.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @beat.to_param
    assert_response :success
  end

  test "should update beat" do
    put :update, :id => @beat.to_param, :beat => @beat.attributes
    assert_redirected_to beat_path(assigns(:beat))
  end

  test "should destroy beat" do
    assert_difference('Beat.count', -1) do
      delete :destroy, :id => @beat.to_param
    end

    assert_redirected_to beats_path
  end
end
