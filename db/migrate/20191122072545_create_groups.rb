class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :workout_focus
      t.boolean :active
      t.datetime :duration

      t.timestamps
    end
  end
end
