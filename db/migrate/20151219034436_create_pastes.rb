class CreatePastes < ActiveRecord::Migration[5.1]
  def change
    create_table :pastes do |t|

      t.string :guid, null: false, unique: true
      t.string :ip, null: false

      t.integer :user_id
      t.integer :parent_id

      t.string :title, null: false
      t.text :content, null: false
      t.boolean :private, default: false

      t.timestamps null: false
    end
  end
end
