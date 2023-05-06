class CreateCages < ActiveRecord::Migration[7.0]
  def change
    create_table :cages do |t|
      t.string :power_status, null: false

      t.timestamps
    end

    change_table :dinosaurs do |t|
      t.belongs_to :cage, null: false, foreign_key: true
    end
  end
end
