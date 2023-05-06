require "test_helper"

class CageTest < ActiveSupport::TestCase
  test "must have a power status" do
    refute Cage.new.valid?
  end

  test "active is a valid power status" do
    assert Cage.new(power_status: "active").valid?
  end

  test "up is not a valid power status" do
    refute Cage.new(power_status: "up").valid?
  end

  test "compatiable dinosaurs are valid" do
    cage = Cage.new(power_status: "active")
    cage.dinosaurs << dinosaurs(:jake) # carnivore / Megalosaurus
    cage.dinosaurs << dinosaurs(:jill) # carnivore / Megalosaurus
    assert cage.valid?
  end

  test "incopatiable dinosaurs are not valid" do
    cage = Cage.new(power_status: "active")
    cage.dinosaurs << dinosaurs(:jake) # carnivore
    cage.dinosaurs << dinosaurs(:jim) # herbivore
    refute cage.valid?
  end

  test "doesn't allow any dinosaurs when cage is down" do
    cage = Cage.new(power_status: "down")
    cage.dinosaurs << dinosaurs(:jake)
    refute cage.valid?
  end
end
