class AddGenderToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :gender, :integer
  end
end
