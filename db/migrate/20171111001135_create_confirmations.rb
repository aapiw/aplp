class CreateConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :confirmations do |t|
      t.string :flight_arrival_number
      t.date :flight_arrival_date
      t.string :flight_arrival_hours
      t.string :flight_return_number
      t.date :date_of_return_flight
      t.string :return_flight_hours
      t.boolean :hijab
      t.integer :dress_size
      t.attachment :script
      t.attachment :arrival_ticket
      t.attachment :return_ticket
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
