class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|

      t.timestamps null: false
    end
  end
end
