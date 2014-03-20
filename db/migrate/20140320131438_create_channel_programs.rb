class CreateChannelPrograms < ActiveRecord::Migration
  def change
    create_table :channel_programs do |t|
    	t.references :channel
    	t.references :program
      	t.timestamps
    end
  end
end
