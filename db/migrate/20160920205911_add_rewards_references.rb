class AddRewardsReferences < ActiveRecord::Migration
  def change
    add_reference :rewards, :application, index: true, foreign_key: true
  end
end
