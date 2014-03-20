class CreatebroadcastsTerms < ActiveRecord::Migration
  def up
  	 create_table :broadcasts_terms do |t|
    	t.references :broadcast
    	t.references :term
    end
  end

  def down
  end
end
