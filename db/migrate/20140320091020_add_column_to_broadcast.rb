class AddColumnToBroadcast < ActiveRecord::Migration
  def change
  	add_column :broadcasts, :identifier, :string
  end
end
