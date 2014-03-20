class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|


		t.string :identifier
		t.string :name

    end
  end
end
