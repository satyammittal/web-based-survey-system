require 'test_helper'

class ForeignKeysControllerTest < ActionController::TestCase
  setup do
    @foreign_key = foreign_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foreign_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foreign_key" do
    assert_difference('ForeignKey.count') do
      post :create, foreign_key: { options,questions: @foreign_key.options,questions }
    end

    assert_redirected_to foreign_key_path(assigns(:foreign_key))
  end

  test "should show foreign_key" do
    get :show, id: @foreign_key
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foreign_key
    assert_response :success
  end

  test "should update foreign_key" do
    patch :update, id: @foreign_key, foreign_key: { options,questions: @foreign_key.options,questions }
    assert_redirected_to foreign_key_path(assigns(:foreign_key))
  end

  test "should destroy foreign_key" do
    assert_difference('ForeignKey.count', -1) do
      delete :destroy, id: @foreign_key
    end

    assert_redirected_to foreign_keys_path
  end
end
