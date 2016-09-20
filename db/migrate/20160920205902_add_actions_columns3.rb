class AddActionsColumns3 < ActiveRecord::Migration
  def change
    add_reference :actions, :application, index: true, foreign_key: true
    add_reference :actions, :user, index: true, foreign_key: true
  end
end
