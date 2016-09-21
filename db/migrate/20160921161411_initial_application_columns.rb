class InitialApplicationColumns < ActiveRecord::Migration
  def change
    add_column :applications, :key, :string
  end
end
