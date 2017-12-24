class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :year
      t.datetime :start_registration
      t.datetime :end_registration
      t.datetime :start_central_selection
      t.datetime :end_central_selection
      t.datetime :start_consulate_selection
      t.datetime :end_consulate_selection

      t.timestamps
    end
  end
end
