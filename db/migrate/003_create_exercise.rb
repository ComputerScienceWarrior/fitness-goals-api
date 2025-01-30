class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :duration
      t.string :muscle_group_worked
      t.decimal :weight
      t.integer :reps
      t.integer :sets
      t.decimal :distance_traveled_mi
      t.decimal :distance_traveled_km

      t.references :workout, null: false, foreign_key: true
      t.timestamps
    end
  end
end
