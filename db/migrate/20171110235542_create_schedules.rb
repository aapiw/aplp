class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :year
      t.date :start_registration
      t.date :end_registration
      t.date :start_central_selection
      t.date :start_consulate_selection
      t.date :end_consulate_selection

      t.timestamps
    end
  end
end
