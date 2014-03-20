class ChannelPrograms < ActiveRecord::Base
  attr_accessible :program_id, :channel_id

  include Neoid::Relationship

  belongs_to :channel
  belongs_to :program

  neoidable do |c|
    c.relationship start_node: :channel, end_node: :program, type: :channel_program
  end

  class << self
    def create_both(channel, program)
      channel.programs.create(program: program)
      program.channels.create(channel: channel)
    end
  end

end
