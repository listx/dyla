require 'test_helper'

class GamestatesControllerTest < ActionController::TestCase
  setup do
    @gamestate = gamestates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gamestates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gamestate" do
    assert_difference('Gamestate.count') do
      post :create, gamestate: {  }
    end

    assert_redirected_to gamestate_path(assigns(:gamestate))
  end

  test "should show gamestate" do
    get :show, id: @gamestate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gamestate
    assert_response :success
  end

  test "should update gamestate" do
    patch :update, id: @gamestate, gamestate: {  }
    assert_redirected_to gamestate_path(assigns(:gamestate))
  end

  test "should destroy gamestate" do
    assert_difference('Gamestate.count', -1) do
      delete :destroy, id: @gamestate
    end

    assert_redirected_to gamestates_path
  end
end
