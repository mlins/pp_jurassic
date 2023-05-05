class Dinosaur < ApplicationRecord
  SPECIES_DIET_MAP = {
    "Tyrannosaurus" => "carnivore",
    "Velociraptor"  => "carnivore",
    "Spinosaurus"   => "carnivore",
    "Megalosaurus"  => "carnivore",
    "Brachiosaurus" => "herbivore",
    "Stegosaurus"   => "herbivore",
    "Ankylosaurus"  => "herbivore",
    "Triceratops"   => "herbivore"
  }

  validates :name, presence: true
  validates :species, presence: true, inclusion: { in: SPECIES_DIET_MAP.keys }
end
