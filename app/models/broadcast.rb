class Broadcast < ActiveRecord::Base
		include Neoid::Node

		belongs_to :program
		has_and_belongs_to_many :terms
		has_and_belongs_to_many :genres
		has_and_belongs_to_many :actors

		attr_accessible :description, :date, :start_time, 
							:end_time, :duration, :summary, :long_description, :identifier, :program_id


		after_initialize :label_node

		neoidable do |c|
      		c.field :identifier
    	end

    	def add_term_to_broadcast(term, weight)
	    	@neo = Neography::Rest.new
	    	rel = @neo.create_relationship("broadcast_term", self.neo_node, term.neo_node)
	    	@neo.set_relationship_properties(rel, {"weight" => weight.to_i})
	  	end

	  	def add_genre_to_broadcast(genre)
	    	@neo = Neography::Rest.new
	    	@neo.create_relationship("broadcast_genre", self.neo_node, genre.neo_node)
	  	end

	  	def add_actor_to_broadcast(actor)
	    	@neo = Neography::Rest.new
	    	@neo.create_relationship("broadcast_actor", self.neo_node, actor.neo_node)
	  	end

	  	def label_node
    		puts "label node "
    		@neo = Neography::Rest.new
    		@neo.set_label(self.neo_node, "Broadcast")
    	end

end