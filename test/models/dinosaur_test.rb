require "test_helper"

class DinosaurTest < ActiveSupport::TestCase
  test "must have a name" do
    refute Dinosaur.new(species: "Tyrannosaurus").valid?
  end

  test "must have a species" do
    refute Dinosaur.new(name: "Fred").valid?
  end

  test "Tyrannosaurus is a valid species" do
    assert Dinosaur.new(name: "Fred", species: "Tyrannosaurus").valid?
  end

  test "Notasaurus is not a valid species" do
    refute Dinosaur.new(name: "Fred", species: "Notasaurus").valid?
  end
end
