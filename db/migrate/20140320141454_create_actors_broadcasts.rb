class CreateActorsBroadcasts < ActiveRecord::Migration
  def change
    create_table :actors_broadcasts do |t| 
    	t.references :broadcast
    	t.references :actor
    end
  end
end
