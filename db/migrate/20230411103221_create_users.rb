class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, default: -> { "uuid_generate_v4()" }, primary_key: true
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
