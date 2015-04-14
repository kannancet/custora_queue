=begin
	This is the main module.
=end
module CustoraQueue

=begin
	The class to deal with game processing.
=end
  class GameReactor

  	attr_accessor :game, :machine

=begin
	This function is used to initialize the game processing.
=end
  	def initialize
  		@game = Game.new
  		@machine = Machine.new(game)
  	end

=begin
	This function is used to run the gane reactor.
=end
		def run
			@turn = Turn.new(game)
			while @turn.instance_variable_get("@status") != 'completed'

				jobs_found = @turn.instance_variable_get("@jobs").size
				print_turn_text(jobs_found)

			  #@turn.assign_jobs2
			  
			  @turn.assign_jobs(machine)		
			  @turn.next_turn
			end

			p @game = @game.reload
		end  	

=begin
	This function is used to run the gane reactor.
=end
		def print_turn_text(jobs_found)
		  turn = {}
		  @turn.instance_variables.each {|var| turn[var.to_s.delete("@")] = @turn.instance_variable_get(var) }
		  puts "On turn #{turn['current_turn']}, got #{turn['jobs'].count} jobs, having completed #{turn['jobs_completed']} of #{jobs_found} with #{turn['jobs_running']} jobs running, #{turn['jobs_queued']} jobs queued, and #{turn['machines_running']} machines running"		
		end

  end

end