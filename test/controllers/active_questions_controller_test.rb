require 'test_helper'

class ActiveQuestionsControllerTest < ActionController::TestCase
  setup do
    @active_question = active_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:active_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create active_question" do
    assert_difference('ActiveQuestion.count') do
      post :create, active_question: { question_id: @active_question.question_id, user_id: @active_question.user_id }
    end

    assert_redirected_to active_question_path(assigns(:active_question))
  end

  test "should show active_question" do
    get :show, id: @active_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @active_question
    assert_response :success
  end

  test "should update active_question" do
    patch :update, id: @active_question, active_question: { question_id: @active_question.question_id, user_id: @active_question.user_id }
    assert_redirected_to active_question_path(assigns(:active_question))
  end

  test "should destroy active_question" do
    assert_difference('ActiveQuestion.count', -1) do
      delete :destroy, id: @active_question
    end

    assert_redirected_to active_questions_path
  end
end
