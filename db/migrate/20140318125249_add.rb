class Add < ActiveRecord::Migration
  def up
  	  add_index :channels, :name
      add_index :programs, :identifier
  end

  def down
  end
end
