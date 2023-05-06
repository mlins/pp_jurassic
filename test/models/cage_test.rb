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
end
