# ardaT 2014, March

# program identifier => channel_name#program_name
# broadcast_identifier => program_identifier#start_time
#
#
#
require 'date'



for file in Dir.glob('public/program_profiles/*') 		
	puts "reading :: :: :: #{Rails.root}/#{file}"
  
	data = File.read("#{Rails.root}/" + file)
	channel_name =  file.split('/')[2].strip.split(".")[0]
	channel = Channel.find_or_create_by_name(channel_name)
	array = JSON.parse(data)
		
	array.each do |obj|
		program = Program.find_or_create_by_identifier_and_name(channel_name + "#" + obj["name"], obj["name"])
		program.channel_id = channel.id
		program.image_url = obj["imageUrl"]
		program.save
		channel.add_program_to_channel(program)
		broadcast = Broadcast.find_or_initialize_by_identifier(program.identifier.to_s + "#" + obj["startTime"].to_s)
		broadcast.description = obj["longDescription"]
		broadcast.summary = obj["summary"]
		broadcast.date = obj["date"]
		broadcast.start_time = DateTime.strptime((obj["startTime"] + 2.hours).to_s,'%s')
		broadcast.end_time = DateTime.strptime((obj["endTime"] + 2.hours).to_s,'%s')
		broadcast.program_id = program.id
		broadcast.save
		program.add_broadcast_to_program(broadcast)
		terms = obj["stemmedWords"]
		terms.each do |t|
			term = Term.find_or_create_by_identifier(t)
			broadcast_term = BroadcastsTerms.find_or_create_by_broadcast_id_and_term_id(broadcast.id, term.id)
			freq = broadcast_term.increment_frequency
			broadcast.add_term_to_broadcast(term, freq.to_s)
		end
		genres = obj["genreList"]
		genres.each do |g|
			genre = Genre.find_or_create_by_identifier(g)
			broadcast.genres << genre
			broadcast.add_genre_to_broadcast(genre)
		end
		actors = obj["actors"]
		actors.each do |a|
			actor = Actor.find_or_create_by_identifier(a)
			broadcast.actors << actor
			broadcast.add_actor_to_broadcast(actor)
		end unless actors.nil?




	end
end
