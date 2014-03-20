class AddFreaquencyToTerms < ActiveRecord::Migration
  def change
  	add_column :broadcasts_terms, :frequency, :integer, :default => 0
  end
end
