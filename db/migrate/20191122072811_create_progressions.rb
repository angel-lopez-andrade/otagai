class CreateProgressions < ActiveRecord::Migration[5.2]
  def change
    create_table :progressions do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.boolean :participation
      t.datetime :time
      t.datetime :date

      t.timestamps
    end
  end
end
