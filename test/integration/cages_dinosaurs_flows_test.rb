require "test_helper"

class CagesDinosaursFlowsTest < ActionDispatch::IntegrationTest
  test "can create a dinosaur in an active cage" do
    post cages_url, params: { cage: { power_status: "active" } }, as: :json
    assert_response :created
    cage_id = response.parsed_body.dig("id")
    post dinosaurs_url, params: { dinosaur: { name: "Nate", species: "Stegosaurus", cage_id: cage_id } }, as: :json
    assert_response :created
  end

  test "can't create a dinosaur in a downed cage" do
    post cages_url, params: { cage: { power_status: "down" } }, as: :json
    assert_response :created
    cage_id = response.parsed_body.dig("id")
    post dinosaurs_url, params: { dinosaur: { name: "Nate", species: "Stegosaurus", cage_id: cage_id } }, as: :json
    assert_response :unprocessable_entity
    assert response.parsed_body.dig("cage") == ["Cage is powered down"]
  end

  test "can't move a dinosaur to a downed cage" do
    dino = dinosaurs(:jake)
    cage = cages(:four)
    put dinosaur_url(dino), params: { dinosaur: { cage_id: cage.id } }, as: :json
    assert_response :unprocessable_entity
    assert response.parsed_body.dig("cage") == ["Cage is powered down"]
  end

  test "can't create a dinosaur in a incompatible cage" do
    cage = cages(:one)
    post dinosaurs_url, params: { dinosaur: { name: "Nate", species: "Tyrannosaurus", cage_id: cage.id } }, as: :json
    assert_response :unprocessable_entity
    assert response.parsed_body.dig("base") == ["Dinosaurs must be compatiable"]
  end

  test "can't move a dinosaur into an incompatible cage" do
    dino = dinosaurs(:sally)
    cage = cages(:one)
    put dinosaur_url(dino), params: { dinosaur: { cage_id: cage.id } }, as: :json
    assert_response :unprocessable_entity
    assert response.parsed_body.dig("base") == ["Dinosaurs must be compatiable"]
  end

  test "can't change power to down if there are dinosaurs in the cage" do
    cage = cages(:one)
    put cage_url(cage), params: { cage: { power_status: "down" } }, as: :json
    assert_response :unprocessable_entity
  end
end
