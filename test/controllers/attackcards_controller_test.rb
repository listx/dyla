require 'test_helper'

class AttackcardsControllerTest < ActionController::TestCase
  setup do
    @attackcard = attackcards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attackcards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attackcard" do
    assert_difference('Attackcard.count') do
      post :create, attackcard: { cost: @attackcard.cost, damage: @attackcard.damage, description: @attackcard.description, name: @attackcard.name }
    end

    assert_redirected_to attackcard_path(assigns(:attackcard))
  end

  test "should show attackcard" do
    get :show, id: @attackcard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attackcard
    assert_response :success
  end

  test "should update attackcard" do
    patch :update, id: @attackcard, attackcard: { cost: @attackcard.cost, damage: @attackcard.damage, description: @attackcard.description, name: @attackcard.name }
    assert_redirected_to attackcard_path(assigns(:attackcard))
  end

  test "should destroy attackcard" do
    assert_difference('Attackcard.count', -1) do
      delete :destroy, id: @attackcard
    end

    assert_redirected_to attackcards_path
  end
end
