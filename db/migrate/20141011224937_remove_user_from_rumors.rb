class RemoveUserFromRumors < ActiveRecord::Migration
  def change
    remove_column :rumors, :user, :string
  end
end
