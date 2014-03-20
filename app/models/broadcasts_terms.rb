class BroadcastsTerms < ActiveRecord::Base
	belongs_to :broadcast
	belongs_to :term

	def increment_frequency
		self.frequency = self.frequency + 1
		self.save
	end


end