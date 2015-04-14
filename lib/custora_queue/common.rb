
=begin
	This function is used to generate object.
=end
	  def object_generator(json_info, this)
		  json_data = JSON.parse(json_info)
		  json_data.map{|key,val|  instance_variable_set("@#{key}", val)}
	  end

=begin
	This function is used to run the gane reactor.
=end
		def print_turn_text(jobs_found)
		  turn = {}
		  @turn.instance_variables.each {|var| turn[var.to_s.delete("@")] = @turn.instance_variable_get(var) }
		  puts "On turn #{turn['current_turn']}, got #{turn['jobs'].count} jobs, having completed #{turn['jobs_completed']} of #{jobs_found} with #{turn['jobs_running']} jobs running, #{turn['jobs_queued']} jobs queued, and #{turn['machines_running']} machines running"		
		end


=begin
	This function is used to print the game text after completion.
=end
		def print_game_text(game)
			@game = @game.reload
			puts "COMPLETED GAME WITH:"
			puts "Total delay: #{game[11]} turns"
			puts "Total cost: $#{game[1]}"
			puts "Total and Maximum Score: $#{game[7]}"
		end