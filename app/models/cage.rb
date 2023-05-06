class Cage < ApplicationRecord
  include ActiveModel::Validations

  POWER_STATUSES = ["active", "down"]

  has_many :dinosaurs, dependent: :destroy

  validates_with CageCompatibilityValidator
  validates_with CagePoweredDownValidator
  validates :power_status, presence: true, inclusion: { in: POWER_STATUSES }
end
