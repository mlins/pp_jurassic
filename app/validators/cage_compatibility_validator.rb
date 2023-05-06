class CageCompatibilityValidator < ActiveModel::Validator
  def validate(record)
    unless record.dinosaurs.all? { |dinosaur| dinosaur.compatible?(record.dinosaurs) }
      record.errors.add(:dinosaurs, "Dinosaurs must be compatiable")
    end
  end
end
