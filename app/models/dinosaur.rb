class Dinosaur < ApplicationRecord
  include ActiveModel::Validations

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

  belongs_to :cage

  validates :name, presence: true
  validates :cage, presence: true
  validates :species, presence: true, inclusion: { in: SPECIES_DIET_MAP.keys }
  validates_with DinosaurCageAcceptingValidator, if: :cage
  validates_with DinosaurCompatibilityValidator, if: :cage

  def compatible?(other_dinosaurs)
    other_dinosaurs.all? do |other_dinosaur|
      diet == "herbivore" || (diet == "carnivore" && species == other_dinosaur.species)
    end
  end

  def diet
    SPECIES_DIET_MAP[species]
  end
end
