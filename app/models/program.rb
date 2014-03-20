class Program < ActiveRecord::Base
 
   include Neoid::Node
    
   belongs_to :channel
   has_many :broadcasts
  


   attr_accessible :name, :identifier, :channel_id

  	neoidable do |c|
      c.field :identifier
    end

	  def add_broadcast_to_program(broadcast)
	    	@neo = Neography::Rest.new
	    	@neo.create_relationship("program_broadcast", self.neo_node, broadcast.neo_node)
	  end
end
