class AddDatabaseConstraints < ActiveRecord::Migration[7.0]
  def up
    change_column :user_groups, :user_id, :integer, null: false
    change_column :user_groups, :group_id, :integer, null: false
    change_column :users, :password_digest, :string, null: false
    add_index :user_groups, :group_id, unique: true
  end

  def down
    change_column :user_groups, :user_id, :string, null: true
    change_column :user_groups, :group_id, :string, null: true
    change_column :users, :password_digest, :string, null: true
    remove_index :user_groups, :group_id
  end
end
