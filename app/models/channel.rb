class Channel < ActiveRecord::Base



	  include Neoid::Node
	  has_many :programs
	  has_many :broadcasts, :through => :programs

	  attr_accessible :name, :programs
	  
	  after_initialize :label_node

	  	neoidable do |c|
	      c.field :name
	    end

	    

	    def add_program_to_channel(program)
	    	@neo = Neography::Rest.new
	    	@neo.create_relationship("channel_program", self.neo_node, program.neo_node)
	    end

	    def label_node
    		puts "label node "
    		@neo = Neography::Rest.new
    		@neo.set_label(self.neo_node, "Channel")
    	end


end
