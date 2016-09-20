class AddUsersReferences < ActiveRecord::Migration
  def change
    add_reference :users, :application, index: true, foreign_key: true
  end
end
