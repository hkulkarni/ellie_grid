class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :time
      t.boolean :reminded_today

      t.timestamps null: false
    end
  end
end
