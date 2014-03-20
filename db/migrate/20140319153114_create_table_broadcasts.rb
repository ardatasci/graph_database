class CreateTableBroadcasts < ActiveRecord::Migration
  def up
  	create_table :broadcasts do |t|
      	t.text		:description, :null => false
      	t.date		:date
      	t.datetime  :start_time
      	t.datetime  :end_time
      	t.integer	:duration
      	t.text		:summary
      	t.text		:long_description
      	t.timestamps
    end
    remove_column :programs, :description
    remove_column :programs, :date
    remove_column :programs, :start_time
    remove_column :programs, :end_time
    remove_column :programs, :duration
    remove_column :programs, :summary
    remove_column :programs, :long_description   
  end

  def down
  end
end
