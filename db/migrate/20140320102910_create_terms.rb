class CreateTerms < ActiveRecord::Migration
  def up
  	create_table :terms do |t|
  		t.string :identifier
  	end
  end

  def down
  end
end
