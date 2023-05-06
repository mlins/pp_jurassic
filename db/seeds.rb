ActiveRecord::Base.transaction do
  cage_one = Cage.create!(power_status: "active")
  Dinosaur.create!(name: "Jake", species: "Tyrannosaurus", cage: cage_one)
  Dinosaur.create!(name: "Sally", species: "Tyrannosaurus", cage: cage_one)
  Dinosaur.create!(name: "Fred",  species: "Tyrannosaurus", cage: cage_one)

  cage_two = Cage.create!(power_status: "active")
  Dinosaur.create!(name: "George", species: "Velociraptor", cage: cage_two)
  Dinosaur.create!(name: "Jane",  species: "Velociraptor", cage: cage_two)
  Dinosaur.create!(name: "Sue",   species: "Velociraptor", cage: cage_two)

  cage_three = Cage.create!(power_status: "active")
  Dinosaur.create!(name: "Jim",   species: "Stegosaurus", cage: cage_three)
  Dinosaur.create!(name: "Bob",   species: "Brachiosaurus", cage: cage_three)
  Dinosaur.create!(name: "Erin", species: "Triceratops", cage: cage_three)

  cage_four = Cage.create!(power_status: "down")
end
