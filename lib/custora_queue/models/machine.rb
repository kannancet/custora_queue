=begin
	This class represnets Machine Model.
=end
	class Machine
		
		include CustoraQueue
		include Common
		attr_accessor :game

=begin
	This method is used create a machine object.
=end
	  def initialize(game)
	  	@game = game
	  	game_id = game.instance_variable_get("@id")
			json_info = RestClient.post("#{HOST}/games/#{game_id}/machines",{}).body
			object_generator(json_info, self)
	  end

=begin
	This method is used delete machine.
=end
	  def destroy
	  	game_id = game.instance_variable_get("@id")
	  	machine_id = self.instance_variable_get("@id")
	    RestClient.delete("#{HOST}/games/#{game_id}/machines/#{machine_id}")
	    machine_json = RestClient.post("#{HOST}/games/#{game_id}/machines", {}).body
	    JSON.parse(machine_json)
	  end

	end
