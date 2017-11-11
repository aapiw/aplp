class CreateToIndonesia < ActiveRecord::Migration[5.1]
  def change
    create_table :to_indonesia do |t|
      t.string :destination
      t.integer :long
      t.integer :unit
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
