class AddActionColumn < ActiveRecord::Migration
  def change
    add_column :actions, :action_value, :string
  end
end
