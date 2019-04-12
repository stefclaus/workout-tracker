class AddUseridToYogaclasses < ActiveRecord::Migration

  def change
    add_column :yogaclasses, :user_id, :integer
  end

end
