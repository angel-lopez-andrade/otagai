class RemoveDurationFromGroup < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :duration, :datetime
  end
end
