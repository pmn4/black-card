class AddRulesColumns2 < ActiveRecord::Migration
  def change
    add_column :rules, :action_type, :string

    add_reference :rules, :reward, index: true, foreign_key: true
    # add_reference :rules, :parent, index: true, foreign_key: true
  end
end
