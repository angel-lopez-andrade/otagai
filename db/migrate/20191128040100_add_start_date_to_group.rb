class AddStartDateToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :start_date, :datetime
  end
end
