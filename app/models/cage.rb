class Cage < ApplicationRecord
  POWER_STATUSES = ["active", "down"]

  has_many :dinosaurs, dependent: :destroy

  validates_associated :dinosaurs
  validates :power_status, presence: true, inclusion: { in: POWER_STATUSES }

  def accepting?
    power_status == "active"
  end

  def accepting_error_message
    if power_status == "down"
      "Cage is powered down"
    end
  end
end
