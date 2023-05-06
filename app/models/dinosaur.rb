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
    case diet
    when "carnivore"
      other_dinosaurs.all? { |dinosaur| dinosaur.diet == "carnivore" } &&
      other_dinosaurs.all? { |dinosaur| dinosaur.species == species }
    when "herbivore"
      other_dinosaurs.all? { |dinosaur| dinosaur.diet == "herbivore" }
    end
  end

  def diet
    SPECIES_DIET_MAP[species]
  end
end
