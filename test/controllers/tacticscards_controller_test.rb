require 'test_helper'

class TacticscardsControllerTest < ActionController::TestCase
  setup do
    @tacticscard = tacticscards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tacticscards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tacticscard" do
    assert_difference('Tacticscard.count') do
      post :create, tacticscard: { cost: @tacticscard.cost, description: @tacticscard.description, name: @tacticscard.name }
    end

    assert_redirected_to tacticscard_path(assigns(:tacticscard))
  end

  test "should show tacticscard" do
    get :show, id: @tacticscard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tacticscard
    assert_response :success
  end

  test "should update tacticscard" do
    patch :update, id: @tacticscard, tacticscard: { cost: @tacticscard.cost, description: @tacticscard.description, name: @tacticscard.name }
    assert_redirected_to tacticscard_path(assigns(:tacticscard))
  end

  test "should destroy tacticscard" do
    assert_difference('Tacticscard.count', -1) do
      delete :destroy, id: @tacticscard
    end

    assert_redirected_to tacticscards_path
  end
end
