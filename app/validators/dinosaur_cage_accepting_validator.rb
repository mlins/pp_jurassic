class DinosaurCageAcceptingValidator < ActiveModel::Validator
  def validate(record)
    unless record.cage.accepting?
      record.errors.add(:cage, record.cage.accepting_error_message)
    end
  end
end
