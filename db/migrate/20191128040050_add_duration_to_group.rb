class AddDurationToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :duration, :interval
  end
end
