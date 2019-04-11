class CreateYogaclasses < ActiveRecord::Migration
  def up
    create_table :yogaclasses do |t|
      t.string :yogaclass
      t.string :instructor
      t.string :description
      t.string :date
    end
  end

  def down
    drop_table :workouts
  end

end
