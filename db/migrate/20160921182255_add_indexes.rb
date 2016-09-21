class AddIndexes < ActiveRecord::Migration
  def change
    add_index :rewards, [:application_id, :name], unique: true

    add_index :applications, :key, unique: true

    add_index :aliases, :key, unique: true
  end
end
