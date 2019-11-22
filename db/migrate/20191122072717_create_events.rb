class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :date
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
