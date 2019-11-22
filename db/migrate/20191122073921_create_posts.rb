class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :discussion, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :date
      t.text :text

      t.timestamps
    end
  end
end
