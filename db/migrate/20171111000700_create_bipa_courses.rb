class CreateBipaCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :bipa_courses do |t|
      t.string :location
      t.integer :long
      t.integer :unit
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
