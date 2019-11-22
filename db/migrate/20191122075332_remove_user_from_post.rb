class RemoveUserFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :user, foreign_key: true
  end
end
