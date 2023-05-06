require "test_helper"

class DinosaursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dinosaur = dinosaurs(:jake)
  end

  test "should get index" do
    get dinosaurs_url, as: :json
    assert_response :success
  end

  test "should create dinosaur" do
    assert_difference("Dinosaur.count") do
      post dinosaurs_url,
        params: { dinosaur: { name: "Nate", species: "Stegosaurus", cage_id: cages(:three).id } },
        as: :json
    end

    assert_response :created
  end

  test "should show dinosaur" do
    get dinosaur_url(@dinosaur), as: :json
    assert_response :success
  end

  test "should update dinosaur" do
    patch dinosaur_url(@dinosaur), params: { dinosaur: { name: "Nate Jr" } }, as: :json
    assert_response :success
  end

  test "should destroy dinosaur" do
    assert_difference("Dinosaur.count", -1) do
      delete dinosaur_url(@dinosaur), as: :json
    end

    assert_response :no_content
  end
end
