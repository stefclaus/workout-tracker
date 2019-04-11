class CreateWorkouts < ActiveRecord::Migration[5.2]
  def up
    create_table :workouts do |t|
      t.string :workout
      t.string :description
      t.integer :duration
      t.string :date
    end
  end

  def down
    drop_table :workouts
  end

end
