=begin
	This class represnets Turn Model.
=end
	class Turn
		include CustoraQueue
		attr_accessor :game

=begin
	This function is used to initialize turn.
=end
		def initialize(game)
			@game = game
			next_turn
		end

=begin
	This function is used to switch to next turm.
=end
		def next_turn
			game_id = game.instance_variable_get("@id")
			json_info = RestClient.get("#{HOST}/games/#{game_id}/next_turn").body
			object_generator(json_info, self)
		end

=begin
	This method is used assign jobs to machines.
=end
	  def assign_jobs(machine)
	  	jobs = instance_variable_get("@jobs")
	  	job_ids = jobs.map{|job| job["id"]}
	  	machine_id = machine.instance_variable_get("@id")
	  	game_id = instance_variable_get("@game").instance_variable_get("@id")

	    RestClient.post(
	      "#{HOST}/games/#{game_id}/machines/#{machine_id}/job_assignments",
	      job_ids: JSON.dump(job_ids)
	    ).body
    end

	  def assign_jobs2
	  	jobs = instance_variable_get("@jobs")
	  	game_id = instance_variable_get("@game").instance_variable_get("@id")
	  	jobs.each do |job|
	  		m = Machine.new(instance_variable_get("@game"))
	  		mid = m.instance_variable_get("@id")
		    RestClient.post(
		      "#{HOST}/games/#{game_id}/machines/#{mid}/job_assignments",
		      job_ids: JSON.dump([job["id"]])
		    ).body
		    m.destroy
	  	end

    end

	end
