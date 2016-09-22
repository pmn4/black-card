class AddRuleCountColumn < ActiveRecord::Migration
  def change
    add_column :rules, :action_count, :integer
  end
end
