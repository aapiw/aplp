class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.decimal :plot
      t.decimal :content
      t.decimal :bahasa
      t.decimal :fluency
      t.decimal :interlude
      t.decimal :gesture
      t.decimal :sound
      t.decimal :duration
      t.decimal :showing
      t.decimal :media
      t.text :note
      t.string :giver
      t.integer :kind
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
