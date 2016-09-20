class AddActionsColumns2 < ActiveRecord::Migration
  def change
    add_column :actions, :params_json, :text
  end
end
