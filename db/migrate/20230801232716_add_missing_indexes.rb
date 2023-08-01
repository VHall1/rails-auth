class AddMissingIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true
    add_index :groups, :name, unique: true
  end
end
