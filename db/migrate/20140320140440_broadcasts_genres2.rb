class BroadcastsGenres2 < ActiveRecord::Migration
  def up
  	 create_table :broadcasts_genres do |t|
    	t.references :broadcast
    	t.references :genre
    end
  end

  def down
  end
end
