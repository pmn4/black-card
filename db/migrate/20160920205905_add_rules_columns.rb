class AddRulesColumns < ActiveRecord::Migration
  def change
    add_reference :rules, :application, index: true, foreign_key: true
  end
end
