class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name, null: false, unique: true
      t.timestamps null: false
    end
  end
end
