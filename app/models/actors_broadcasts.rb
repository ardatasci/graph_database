class ActorsBroadcasts < ActiveRecord::Base
  belongs_to :actor
  belongs_to :broadcast
end