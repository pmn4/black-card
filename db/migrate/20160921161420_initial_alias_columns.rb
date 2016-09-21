class InitialAliasColumns < ActiveRecord::Migration
  def change
    add_column :aliases, :key, :string
    add_reference :aliases, :user, index: true, foreign_key: true
  end
end
