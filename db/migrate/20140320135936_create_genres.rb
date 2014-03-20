class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
    	t.string :identifier
    end
  end
end
