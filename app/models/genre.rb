class Genre < ActiveRecord::Base
  	include Neoid::Node
    
	has_and_belongs_to_many :broadcasts

  


   attr_accessible :identifier

  	neoidable do |c|
      c.field :identifier
    end

end
