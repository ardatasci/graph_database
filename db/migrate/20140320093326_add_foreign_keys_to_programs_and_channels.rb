class AddForeignKeysToProgramsAndChannels < ActiveRecord::Migration
  def change
  	add_column :programs, :channel_id, :integer
  	add_column :broadcasts, :program_id, :integer
  end
end
