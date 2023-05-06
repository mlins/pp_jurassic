require "test_helper"

class DinosaurTest < ActiveSupport::TestCase
  test "must have a name" do
    refute Dinosaur.new(species: "Tyrannosaurus", cage_id: cages(:one).id).valid?
  end

  test "must have a species" do
    refute Dinosaur.new(name: "Fred", cage_id: cages(:one).id).valid?
  end

  test "must have a cage" do
    refute Dinosaur.new(name: "Fred", species: "Tyrannosaurus").valid?
  end

  test "Tyrannosaurus is a valid species" do
    assert Dinosaur.new(name: "Fred", species: "Tyrannosaurus", cage_id: cages(:two).id).valid?
  end

  test "Notasaurus is not a valid species" do
    refute Dinosaur.new(name: "Fred", species: "Notasaurus", cage_id: cages(:one).id).valid?
  end

  test "compatiable dinosaurs are valid" do
    assert Dinosaur.new(name: "Fred", species: "Megalosaurus", cage_id: cages(:one).id).valid?
  end

  test "incopatiable dinosaurs are not valid" do
    refute Dinosaur.new(name: "Fred", species: "Tyrannosaurus", cage_id: cages(:one).id).valid?
  end

  test "doesn't allow any dinosaurs when cage is down" do
    refute Dinosaur.new(name: "Fred", species: "Tyrannosaurus", cage_id: cages(:four).id).valid?
  end

  test "diet returns carnivore for Tyrannosaurus" do
    assert "carnivore", dinosaurs(:jake).diet
  end

  test "compatible? returns true if all dinosaurs are herbivores" do
    assert dinosaurs(:ted).compatible?([dinosaurs(:jim), dinosaurs(:janelle)])
  end

  test "compatible? returns true if dinosaurs are the same species" do
    assert dinosaurs(:jake).compatible?([dinosaurs(:jill)])
  end

  test "compatible? returns false if dinosaurs have different diets" do
    refute dinosaurs(:jake).compatible?([dinosaurs(:jim)])
  end

  test "compatible? returns false if dinosaurs are carnivores and are different species" do
    refute dinosaurs(:jake).compatible?([dinosaurs(:sally)])
  end
end
