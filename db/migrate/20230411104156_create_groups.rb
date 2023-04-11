class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups, id: false do |t|
      t.string :id, default: -> { "uuid_generate_v4()" }, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
