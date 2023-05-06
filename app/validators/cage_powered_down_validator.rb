class CagePoweredDownValidator < ActiveModel::Validator
  def validate(record)
    if record.power_status == "down" && record.dinosaurs.size > 0
      record.errors.add(:power_status, "Cage cannot have dinosaurs if power status is down")
    end
  end
end
