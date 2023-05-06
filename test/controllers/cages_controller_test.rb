require "test_helper"

class CagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @active_cage = cages(:one)
    @down_cage = cages(:four)
  end

  test "should get index" do
    get cages_url, as: :json
    assert_response :success
  end

  test "should create cage" do
    assert_difference("Cage.count") do
      post cages_url, params: { cage: { power_status: "active" } }, as: :json
    end

    assert_response :created
  end

  test "should show cage" do
    get cage_url(@active_cage), as: :json
    assert_response :success
  end

  test "should update cage" do
    patch cage_url(@down_cage), params: { cage: { power_status: "active" } }, as: :json
    assert_response :success
  end

  test "should destroy cage" do
    assert_difference("Cage.count", -1) do
      delete cage_url(@active_cage), as: :json
    end

    assert_response :no_content
  end
end
