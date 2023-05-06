class DinosaurCompatibilityValidator < ActiveModel::Validator
  def validate(record)
    unless record.compatible?(record.cage.dinosaurs)
      record.errors.add(:base, "Dinosaurs must be compatiable")
    end
  end
end
