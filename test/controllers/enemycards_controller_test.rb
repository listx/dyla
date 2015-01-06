require 'test_helper'

class EnemycardsControllerTest < ActionController::TestCase
  setup do
    @enemycard = enemycards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enemycards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enemycard" do
    assert_difference('Enemycard.count') do
      post :create, enemycard: { damage: @enemycard.damage, description: @enemycard.description, hp: @enemycard.hp, name: @enemycard.name, tp: @enemycard.tp, vp: @enemycard.vp }
    end

    assert_redirected_to enemycard_path(assigns(:enemycard))
  end

  test "should show enemycard" do
    get :show, id: @enemycard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enemycard
    assert_response :success
  end

  test "should update enemycard" do
    patch :update, id: @enemycard, enemycard: { damage: @enemycard.damage, description: @enemycard.description, hp: @enemycard.hp, name: @enemycard.name, tp: @enemycard.tp, vp: @enemycard.vp }
    assert_redirected_to enemycard_path(assigns(:enemycard))
  end

  test "should destroy enemycard" do
    assert_difference('Enemycard.count', -1) do
      delete :destroy, id: @enemycard
    end

    assert_redirected_to enemycards_path
  end
end
