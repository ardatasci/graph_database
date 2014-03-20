class Term < ActiveRecord::Base
	include Neoid::Node
    
	has_and_belongs_to_many :broadcasts

	after_initialize :label_node

  


   attr_accessible :identifier

  	neoidable do |c|
      c.field :identifier
    end

    def label_node
    	puts "label node "
    	@neo = Neography::Rest.new
    	@neo.set_label(self.neo_node, "Term")
    end

	 


end