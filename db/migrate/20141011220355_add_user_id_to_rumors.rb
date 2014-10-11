class AddUserIdToRumors < ActiveRecord::Migration
  def change
    add_column :rumors, :user_id, :integer
  end
end
