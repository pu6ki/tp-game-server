require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  setup do
    @level = levels(:one)
    @score = scores(:one)
  end

  test "should get index" do
    get :index, params: { level_id: @level }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { level_id: @level }
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post :create, params: { level_id: @level, score: @score.attributes }
    end

    assert_redirected_to level_score_path(@level, Score.last)
  end

  test "should show score" do
    get :show, params: { level_id: @level, id: @score }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { level_id: @level, id: @score }
    assert_response :success
  end

  test "should update score" do
    put :update, params: { level_id: @level, id: @score, score: @score.attributes }
    assert_redirected_to level_score_path(@level, Score.last)
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete :destroy, params: { level_id: @level, id: @score }
    end

    assert_redirected_to level_scores_path(@level)
  end
end
