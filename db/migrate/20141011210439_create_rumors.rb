class CreateRumors < ActiveRecord::Migration
  def change
    create_table :rumors do |t|
    	t.string :user
    	t.string :status

      t.timestamps
    end
  end
end
