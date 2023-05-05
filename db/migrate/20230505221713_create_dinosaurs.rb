class CreateDinosaurs < ActiveRecord::Migration[7.0]
  def change
    create_table :dinosaurs do |t|
      t.string :name, null: false
      t.string :species, null: false

      t.timestamps
    end
  end
end
