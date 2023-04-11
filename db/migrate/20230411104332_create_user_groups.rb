class CreateUserGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.string :user_id
      t.string :group_id

      t.timestamps
    end

    add_foreign_key :user_groups, :users, column: :user_id
    add_foreign_key :user_groups, :groups, column: :group_id
  end
end
