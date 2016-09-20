class AddRewardsColumns < ActiveRecord::Migration
  def change
    add_column :rewards, :name, :string
    add_column :rewards, :description, :string
  end
end
