class AddEndDateToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :end_date, :datetime
  end
end
